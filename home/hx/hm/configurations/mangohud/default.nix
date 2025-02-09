{ pkgs, ... }:

{
  home-manager.users.hx = {
    xdg.configFile = {
      "MangoHud/MangoHud.conf".source = ./MangoHud.conf;
    };
  };
}
