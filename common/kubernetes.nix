{pkgs, ...}:

{
  home-manager.users.skandix.home.packages = with pkgs; [
    unstable.kubectl
    unstable.kubectx
    unstable.kubernetes-helm
    unstable.lens
  ];
}
