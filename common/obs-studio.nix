{pkgs, ...}:

{
  home-manager.users.skandix = {
    home.packages = with pkgs; [
      unstable.obs-studio
    ];
  };
}
