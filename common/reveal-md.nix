{pkgs, ...}:

{
  home-manager.users.skandix.home.packages = with pkgs; [
    nodePackages.reveal-md
  ];
}
