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
            zlib
            gnutar

            # Libs
            libnotify
            inotify-tools
            libopenmpt

            # Terminal Multiplexers
            screen

            # LANG STUFF
            gnumake
            go

            # Fixed vscode cant click on account icon
            gnome.gnome-keyring

            # Misc Tools
            #unstable.nodePackages.reveal-md
            #unstable.openstackclient
            #unstable.jq
            #unstable.htop
            terraform
            dig
            yt-dlp
            bat
            wget
            git
            ncdu
            termdown
            xclip
            pfetch
            minicom
            ffmpeg
            pipenv
        ];
    };
}
