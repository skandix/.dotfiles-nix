{ pkgs, ... }:

{
  home-manager.users.hx = {
    xdg.configFile = { "discord/settings.json".source = ./settings.json; };
  };
}
