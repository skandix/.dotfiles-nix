{ config, pkgs, ... }:

{
  imports = [
    ./hm/configurations/git
    # ./hm/configurations/helix
    ./hm/configurations/vim
    ./hm/configurations/tmux
    # ./hm/python.nix
    # ./hm/rust.nix
  ];

  home-manager.users.hx = {
    home.packages = with pkgs; [
      ## GENERAL CLI
      p7zip
      zlib
      gnutar
      libnotify
      inotify-tools
      pywal
      gnumake
      gnome.gnome-keyring
      jq
      htop
      yt-dlp
      bat
      wget
      git
      ncdu
      xclip
      pfetch
      minicom
      ffmpeg

      ## PROGRAMMING LANGUAGES
      go

      ## NETWORK TOOLS
      dig
      traceroute
      ldns
      mtr
      wireshark
      tcpdump
      speedtest-cli

      ## NFC TOOLS
      mfoc
      mfcuk

      ## OPS TOOLS
      kubectl
      kubectx
      k9s
      vagrant
      terraform
      ansible-core
      openstackclient
    ];
  };
}
