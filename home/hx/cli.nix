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
  ];

  programs.nix-index-database.comma.enable = true;

  home-manager.users.hx = {
    home.packages = with pkgs; [
      p7zip
      gnome-keyring
      jq
      htop
      wget
      ncdu
      ntfs3g
      ranger
      bat
      ripgrep

      # SRE
      talosctl
      kubectl
      kubecolor
      k9s
      opentofu
      ansible
      openstackclient
      kubernetes-helm
      kubeseal
      packer
      marp-cli
    ];
  };
}
