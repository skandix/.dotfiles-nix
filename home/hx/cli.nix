{ pkgs, unstable, ... }:

{
  programs.nix-index-database.comma.enable = true;

  home-manager.users.hx = {
    imports = [
      ./modules/vim
      ./modules/tmux
      ./modules/k9s
      ./modules/git
      ./modules/zsh
    ];

    home.packages = with pkgs; [
      p7zip
      jq
      htop
      wget
      ncdu
      ranger
      bat
      marp-cli
      typst

      # SRE
      talosctl
      kubectl
      krew
      opentofu
      ansible
      openstackclient
      kubernetes-helm
      kubeseal
      kubecolor
      packer
      cilium-cli
    ];
  };
}
