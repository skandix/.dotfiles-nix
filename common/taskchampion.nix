{ config, pkgs, ... }:

{
    services.taskchampion-sync-server = {
        enable = true;
        snapshot = {
            days = 7;
        };
        openFirewall = true;
        host = "127.0.0.1";
    };
}
