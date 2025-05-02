
{ pkgs, ... }:

{

  home.packages = with pkgs; [
    mpv
    yt-dlp
    streamlink
    ffmpeg
  ];

  xdg.configFile = {
    "mpv/mpv.conf".source = ./mpv.conf;
  };
}
