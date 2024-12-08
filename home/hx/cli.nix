{ config, pkgs, unstable, ... }:

{
  imports = [
    ./hm/configurations/vim
    ./hm/configurations/tmux
    ./hm/configurations/zsh
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
      gnome-keyring
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
      kubecolor
      k9s
      opentofu
      ansible
      openstackclient
      packer
      #rbw
      reveal-md
      ripgrep
      talosctl
      dive
    ];
  };
}
