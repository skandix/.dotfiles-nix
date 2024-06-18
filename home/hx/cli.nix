{ config, pkgs, unstable, ... }:

{
  imports = [
    ./hm/configurations/vim
    ./hm/configurations/tmux
    ./hm/python.nix
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
      # yt-dlp
      bat
      wget
      git
      ncdu
      xclip
      pfetch
      minicom
      unstable.ffmpeg
      pulseaudio # needed for pactl
      glib
      qemu

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
      # mfoc
      # mfcuk

      ## OPS TOOLS
      kubectl
      kubectx
      k9s
      vagrant
      terraform
      ansible
      openstackclient
      packer

      ## CTF
      # volatility # error: 'volatility' has been removed, as it was broken and unmaintained
      # hexedit
      # strace
      # ltrace
      # netcat-gnu
      # nmap
      # seclists
      # binwalk
      # msitools
    ];
  };
}
