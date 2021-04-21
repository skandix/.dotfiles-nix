{ config, pkgs, ... }:

{
    imports = [
        # cli
        ./confs/vim/default.nix
        ./confs/bashrc/default.nix

        # Common - Repo
        ../../common/repo/unstable.nix
        ../../common/repo/master.nix
    ];

    home-manager.users.skandix = {
        home.packages = with pkgs; [
            # Hardware info
            lm_sensors

            # Archive
            unzip
            unrar
            p7zip

            # Libs
            libnotify
            inotify-tools

            # Terminal Multiplexers
            screen

            # iot
            mosquitto

            # Misc Tools
            unstable.jq
            wget
            git
            bat
            ncdu
            termdown
            unstable.htop
            xclip
        ];
    };
}
