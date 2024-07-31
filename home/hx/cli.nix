{ config, pkgs, unstable, ... }:

{
  imports = [
    ./hm/configurations/vim
    ./hm/configurations/tmux
    ./hm/dev.nix
  ];

  home-manager.users.hx = {
    home.packages = with pkgs; [
      p7zip
      zlib
      gnutar
      libnotify
      inotify-tools
      gnumake
      gnome.gnome-keyring
      jq
      htop
      bat
      wget
      ncdu
      xclip
      qemu
      ntfs3g
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
