{ config, pkgs, ... }:

{
    services.prometheus.exporters = {
        zfs = {
            enable = true;
            openFirewall = true;
        };

        node = {
            enable = true;
            openFirewall = true;
            port = 9101;
        };
    };
}
