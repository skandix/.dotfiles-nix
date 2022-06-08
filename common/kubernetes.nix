{pkgs, ...}:

{
  home-manager.users.skandix.home.packages = with pkgs; [
    kubectl
    kubectx
    kubernetes-helm
    lens
  ];
}
