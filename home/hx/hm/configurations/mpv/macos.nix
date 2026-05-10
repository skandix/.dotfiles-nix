
{ pkgs, ... }:

{

  home.packages = with pkgs; [
    mpv
    streamlink
    ffmpeg
  ];

  xdg.configFile = {
    "mpv/mpv.conf".source = ./mpv.conf;
  };
}
