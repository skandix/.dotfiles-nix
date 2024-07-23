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
      p7zip
      sshfs-fuse
      zlib
      gnutar
      libnotify
      inotify-tools
      pywal
      gnumake
      gnome.gnome-keyring
      jq
      htop
      bat
      wget
      ncdu
      xclip
      pfetch
      pulseaudio # needed for pactl
      ntfs3g
      go
      dig
      traceroute
      mtr
      tcpdump
      speedtest-cli
      kubectl
      k9s
      terraform
      ansible
      openstackclient
      packer
    ];
  };
}
