{pkgs, ...}:

{
home-manager.users.skandix = {
  home.packages = with pkgs; [
      mpv
      unstable.youtube-dl
      unstable.streamlink
    ];

    xdg.configFile = {
      "mpv/mpv.conf".source = ./mpv.conf;
    };
  };
}
