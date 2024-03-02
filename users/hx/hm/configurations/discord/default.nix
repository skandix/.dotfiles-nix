{ pkgs, ... }:

{
  home-manager.users.hx = {
    xdg.configFile = { "discord/files/settings.json".source = ./settings.json; };
  };
}
