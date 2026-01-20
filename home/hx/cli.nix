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
    ./hm/configurations/k9s
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
      marp-cli

      # SRE
      talosctl
      kubectl
      kubecolor
      opentofu
      ansible
      openstackclient
      kubernetes-helm
      kubeseal
      packer
      cilium-cli
    ];
  };
}
