{pkgs, ...}:

{
  home-manager.users.hx = {
    home.packages = with pkgs; [
      obs-studio
    ];
  };
}
