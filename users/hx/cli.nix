{ config, pkgs, ... }:

{
    imports = [
        # cli
        ./confs/vim/default.nix
        ./confs/tmux/default.nix
        ./confs/git.nix

        # Common - Repo
        ../../common/repo/unstable.nix
        ../../common/repo/master.nix
    ];

    home-manager.users.hx = {
        home.packages = with pkgs; [
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

            ## it ork
            #kubectl
            #k9s
            #lens
            #terraform
            ##ansible-core

            # LANG STUFF
            gnumake
            go

            # Fixed vscode cant click on account icon
            gnome.gnome-keyring

            # Misc Tools
            #unstable.nodePackages.reveal-md
            openstackclient
            jq
            htop
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
