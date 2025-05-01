{ pkgs, ... }:

{
  home-manager.users.hx = {
    programs.mangohud = {
      enable = true;
      enableSessionWide = false;
    };
    xdg.configFile = {
      "MangoHud/MangoHud.conf".source = ./MangoHud.conf;
    };
  };
}
