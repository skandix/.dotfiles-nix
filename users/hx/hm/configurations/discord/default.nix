{ pkgs, ... }:

{
  xdg.configFile = { "discord/files/settings.json".source = ./settings.json; };
}
