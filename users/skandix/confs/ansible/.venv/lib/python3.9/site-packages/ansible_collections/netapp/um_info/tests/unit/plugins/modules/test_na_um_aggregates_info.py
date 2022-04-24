# (c) 2020, NetApp, Inc
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

""" unit tests for Ansible module: na_um_aggregates_info """

from __future__ import (absolute_import, division, print_function)
__metaclass__ = type
import json
import pytest
import sys

from ansible.module_utils import basic
from ansible.module_utils._text import to_bytes
from ansible_collections.netapp.um_info.tests.unit.compat import unittest
from ansible_collections.netapp.um_info.tests.unit.compat.mock import patch, Mock
import ansible_collections.netapp.um_info.plugins.module_utils.netapp as netapp_utils

from ansible_collections.netapp.um_info.plugins.modules.na_um_aggregates_info\
    import NetAppUMAggregate as my_module  # module under test


if not netapp_utils.HAS_REQUESTS and sys.version_info < (2, 7):
    pytestmark = pytest.mark.skip('Skipping Unit Tests on 2.6 as requests is not be available')


# REST API canned responses when mocking send_request
SRR = {
    # common responses
    'empty_not_so_good': ({}, None),
    'end_of_sequence': (None, "Unexpected call to send_request"),
    'generic_error': (None, "Expected error"),
    'get_next': (dict(_links=dict(self='me', next=dict(href='next_records'))), None),
    'get_data': (dict(_links=dict(self='me'), records=['data1', 'data2'], total_records=2), None),
    'get_data_missing_field': (dict(_links=dict(self='me'), records=['data1', 'data2']), None),
    # module specific responses
    'get_aggregates': {'name': 'ansible'}
}


def set_module_args(args):
    """prepare arguments so that they will be picked up during module creation"""
    args = json.dumps({'ANSIBLE_MODULE_ARGS': args})
    basic._ANSIBLE_ARGS = to_bytes(args)  # pylint: disable=protected-access


class AnsibleExitJson(Exception):
    """Exception class to be raised by module.exit_json and caught by the test case"""
    pass


class AnsibleFailJson(Exception):
    """Exception class to be raised by module.fail_json and caught by the test case"""
    pass


def exit_json(*args, **kwargs):  # pylint: disable=unused-argument
    """function to patch over exit_json; package return data into an exception"""
    if 'changed' not in kwargs:
        kwargs['changed'] = False
    raise AnsibleExitJson(kwargs)


def fail_json(*args, **kwargs):  # pylint: disable=unused-argument
    """function to patch over fail_json; package return data into an exception"""
    kwargs['failed'] = True
    raise AnsibleFailJson(kwargs)


class MockUMConnection(object):
    ''' mock server connection to Unified Manager host '''

    def __init__(self):
        ''' pass init '''


class TestMyModule(unittest.TestCase):
    ''' a group of related Unit Tests '''

    def setUp(self):
        self.mock_module_helper = patch.multiple(basic.AnsibleModule,
                                                 exit_json=exit_json,
                                                 fail_json=fail_json)
        self.mock_module_helper.start()
        self.addCleanup(self.mock_module_helper.stop)
        self.server = MockUMConnection()
        # whether to use a mock or a simulator
        self.onbox = False

    def set_default_args(self):
        if self.onbox:
            hostname = '10.10.10.10'
            username = 'admin'
            password = 'password'
        else:
            hostname = 'hostname'
            username = 'username'
            password = 'password'
        return dict({
            'hostname': hostname,
            'username': username,
            'password': password,
        })

    def test_module_fail_when_required_args_missing(self):
        ''' required arguments are reported as errors '''
        with pytest.raises(AnsibleFailJson) as exc:
            set_module_args({})
            my_module()
        print('Info: %s' % exc.value.args[0]['msg'])

    @patch('ansible_collections.netapp.um_info.plugins.modules.na_um_aggregates_info.NetAppUMAggregate.get_aggregates')
    def test_ensure_list_aggregates_get_called(self, get_aggregates):
        ''' fetching details of aggregates '''
        set_module_args(self.set_default_args())
        my_obj = my_module()
        my_obj.server = self.server
        my_obj.get_aggregates = Mock(return_value=SRR['get_aggregates'])
        with pytest.raises(AnsibleExitJson) as exc:
            my_obj.apply()
        assert exc.value.args[0]['changed']
        # to reset na_helper from remembering the previous 'changed' value

    @patch('ansible_collections.netapp.um_info.plugins.modules.na_um_aggregates_info.NetAppUMAggregate.get_aggregates')
    def test_ensure_get_called_existing(self, get_aggregates):
        ''' test for existing aggregates'''
        set_module_args(self.set_default_args())
        my_obj = my_module()
        my_obj.get_aggregates = Mock(return_value=SRR['get_aggregates'])
        assert my_obj.get_aggregates() is not None

    @patch('ansible_collections.netapp.um_info.plugins.module_utils.netapp.UMRestAPI.send_request')
    def test_get_next(self, mock_request):
        ''' test for existing aggregates'''
        set_module_args(self.set_default_args())
        mock_request.side_effect = [
            SRR['get_next'],
            SRR['get_data'],
            SRR['end_of_sequence'],
        ]
        my_obj = my_module()
        assert my_obj.get_aggregates() is not None

    @patch('ansible_collections.netapp.um_info.plugins.module_utils.netapp.UMRestAPI.send_request')
    def test_negative_get_next(self, mock_request):
        ''' test for existing aggregates'''
        set_module_args(self.set_default_args())
        mock_request.side_effect = [
            SRR['get_next'],
            SRR['get_data_missing_field'],
            SRR['end_of_sequence'],
        ]
        my_obj = my_module()
        with pytest.raises(AnsibleFailJson) as exc:
            my_obj.get_aggregates() is not None
        print(exc.value.args[0])
        msg = 'unexpected response from datacenter/storage/aggregates?order_by=performance_capacity.used'
        assert msg in exc.value.args[0]['msg']
        msg = "expecting key: 'total_records'"
        assert msg in exc.value.args[0]['msg']
