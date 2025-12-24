{ config, pkgs, ... }:

{
    services.taskchampion-sync-server = {
        enable = true;
        user =  "hx";
        snapshot = {
            days = 7;
        };
        openfirewall = true;
        host = "127.0.0.1";
        dataDir = "/home/hx/taskChampion";
    };
}
