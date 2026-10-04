{ pkgs, ... }:

{

  programs.mpv = {
    enable = true;
  };

  home.packages = with pkgs; [
    yt-dlp
    streamlink
    ffmpeg
  ];

  xdg.configFile = {
    "mpv/mpv.conf".source = ./mpv.conf;
  };
}
