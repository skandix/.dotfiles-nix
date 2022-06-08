{pkgs, ...}:

{
  home-manager.users.skandix = {
    home.packages = with pkgs; [
      obs-studio
    ];
  };
}
