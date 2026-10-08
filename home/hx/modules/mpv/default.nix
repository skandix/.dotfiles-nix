{ pkgs, ... }:

{
  programs.mpv = {
    enable = true;
    defaultProfiles = [
      "gpu-hq"
    ];
    config = {
      idle = true;
      cache = true;
      hwdec = "auto-safe";
      vo = "gpu";
      ytdl-format = "bestvideo[height<=?1080]+bestaudio/best";
    };
  };

  home.packages = with pkgs; [
    yt-dlp
    streamlink
    ffmpeg
  ];
}
