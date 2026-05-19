{ pkgs, ... }:
{
  home-manager.users.hx = {
    home.packages = with pkgs; [
      discord
  ];
    xdg.configFile = {
      "discord/settings.json".source = ./settings.json;
    };
  };
}
