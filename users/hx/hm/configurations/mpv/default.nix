{ pkgs, ... }:

{
  home-manager.users.hx = {
    home.packages = with pkgs; [ mpv youtube-dl streamlink ];

    xdg.configFile = { "mpv/files/mpv.conf".source = ./mpv.conf; };
  };
}
