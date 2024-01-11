{pkgs, ...}:

{
  home-manager.users.hx = {
    home.packages = with pkgs; [
      flameshot
    ];
    xdg.configFile = {
      "flameshot/files/flameshot.ini".source = ./flameshot.ini;
    };
  };
}
