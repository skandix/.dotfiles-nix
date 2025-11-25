{ config, pkgs, ... }:

{
    system.autoUpgrade = {
        enable = true;
        persistent = true;
        flake = "github:skandix/.dotfiles-nix";

        dates = "daily";
        operation = "switch";
        allowReboot = true;
        randomizedDelaySec = "10min";
    };
}
