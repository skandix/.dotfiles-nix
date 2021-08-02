{pkgs, ...}:

{
  home-manager.users.skandix = {
    home.packages = with pkgs; [
      flameshot
    ];
    xdg.configFile = {
      "flameshot/flameshot.ini".source = ./flameshot.ini;
    };
  };
}
