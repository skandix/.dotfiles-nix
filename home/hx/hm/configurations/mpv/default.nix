{ pkgs, ... }:

{

home-manager.users.hx = {
  programs.mpv = {
    enable = true;
  };


  # TODO: add config inline
  home.packages = with pkgs; [
    yt-dlp
    streamlink
    ffmpeg
  ];

  xdg.configFile = {
    "mpv/mpv.conf".source = ./mpv.conf;
  };
};
}
