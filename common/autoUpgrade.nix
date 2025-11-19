{ config, pkgs, ... }:

{
    system.autoUpgrade = {
        enable = true;
        persistent = true;
        flake = "github:skandix/.dotfiles-nix";

        dates = "daily";
        operation = "switch";
        allowReboot = true;
        rebootWindow = {
            upper = "05:00";
            lower = "02:00";
        };

        randomizedDelaySec = "10min";
    };
}
