{pkgs, ...}:

{
  home-manager.users.hx = {
    home.packages = with pkgs; [
      kubectl
      kubectx
      kubernetes-helm
      lens
    ];
  };
}
