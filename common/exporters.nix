{ config, pkgs, ... }:

{
    services.prometheus.exporter = {
        zfs = {
            enable = true;
        };
    };
}
