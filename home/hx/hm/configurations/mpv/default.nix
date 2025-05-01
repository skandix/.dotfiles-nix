{ pkgs, ... }:

{

home-manager.users.hx = {
  home.packages = with pkgs; [
    mpv
    yt-dlp
    streamlink
    ffmpeg
  ];

  xdg.configFile = {
    "mpv/mpv.conf".source = ./mpv.conf;
  };
};
}
