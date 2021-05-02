{ config, pkgs, ... }:

{
    imports = [
        # cli
        ./confs/vim/default.nix
        ./confs/tmux/default.nix
        ./confs/moc/default.nix
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
            unstable.jq
            wget
            git
            bat
            ncdu
            termdown
            unstable.htop
            xclip
            pfetch
            minicom

            # rev windows msi
            msitools

            # git gat
            lazygit
        ];
    };
}
