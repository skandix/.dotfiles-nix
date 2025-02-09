{ pkgs, ... }:
{
  home-manager.users.hx = {
    home.packages = with pkgs; [
      discord
      kdePackages.xwaylandvideobridge
  ];
    xdg.configFile = {
      "discord/settings.json".source = ./settings.json;
    };
  };
}
