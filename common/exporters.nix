{ config, pkgs, ... }:

{

    services.prometheus.exporters = {
        zfs = {
            enable = true;
        };
    };
}
