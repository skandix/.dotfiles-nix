{
  config,
  pkgs,
  unstable,
  ...
}:

{
  imports = [
    ./hm/configurations/vim
    ./hm/configurations/tmux
    ./hm/go.nix
    ./hm/python.nix
    ./hm/rust.nix
  ];

  programs.nix-index-database.comma.enable = true;

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
      reveal-md
      talosctl
      bambu-studio
      ranger
      nixfmt-rfc-style
      kubernetes-helm
      kubeseal
      packer
    ];
  };
}
