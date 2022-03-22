{ config, pkgs, ... }:

{
    imports = [
        # cli
        ./confs/vim/default.nix
        ./confs/tmux/default.nix
        #./confs/git.nix
        ./confs/newsboat.nix

        # Common - Repo
        ../../common/repo/unstable.nix
        ../../common/repo/master.nix
    ];

    home-manager.users.skandix = {
        home.packages = with pkgs; [
            # Hardware info
            lm_sensors

            # Archive
            zip
            unzip
            unrar
            p7zip

            # Libs
            libnotify
            inotify-tools

            # Terminal Multiplexers
            screen

            # LANG STUFF
            go
            gnumake

            # Misc Tools
            bat
            unstable.jq
            wget
            git
            ncdu
            termdown
            unstable.htop
            xclip
            pfetch
            minicom
            ffmpeg
            keybase
            mkdocs
        ];
    };
}
