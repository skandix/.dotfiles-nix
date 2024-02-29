{ config, pkgs, ... }:

{
    imports = [
        ./hm/configurations/vim
        ./hm/configurations/tmux
        ./hm/configurations/git
    ];

    home-manager.users.hx = {
        home.packages = with pkgs; [
            zip
            unzip
            unrar
            p7zip
            zlib
            gnutar
            libnotify
            inotify-tools
            pywal
            gnumake
            go
            gnome.gnome-keyring
            nodePackages.reveal-md
            jq
            htop
            dig
            yt-dlp
            bat
            wget
            git
            ncdu
            xclip
            pfetch
            minicom
            ffmpeg
            pipenv
            traceroute
            ldns
            mtr
            wireshark
            tcpdump
            speedtest-cli
            mfoc
            mfcuk
        ];
    };
}
