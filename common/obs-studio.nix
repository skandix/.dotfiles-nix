{pkgs, ...}:

{
  home-manager.users.skandix = {
    home.packages = with pkgs; [
      unstable.obs-studio
      #unstable.obs-ndi
      obs-linuxbrowser
    ];
  };
}
