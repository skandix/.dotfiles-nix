{ pkgs, unstable, ... }:

{
  programs.nix-index-database.comma.enable = true;

  home-manager.users.hx = {
    imports = [
      ./hm/configurations/vim
      ./hm/configurations/tmux
      ./hm/configurations/k9s
    ];

    home.packages = with pkgs; [
      p7zip
      jq
      htop
      wget
      ncdu
      ntfs3g
      ranger
      bat
      marp-cli
      typst

      # SRE
      talosctl
      kubectl
      krew
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
