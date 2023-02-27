{pkgs, ...}:

{
  home-manager.users.hx = {
    home.packages = with pkgs; [
      nodePackages.reveal-md
    ];
  }
}
