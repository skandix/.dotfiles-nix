{config, pkgs, ...}:

{
  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
    extraModules = [ pkgs.pulseaudio-modules-bt ];
    extraConfig = ''
      unload-module module-role-cork
      load-module module-switch-on-connect
      unload-module module-switch-on-port-available
    '';
    daemon.config = {
      default-sample-format = "float32le";
      default-sample-rate = "48000";
      default-sample-channels = "2";
      default-channel-map = "front-left,front-right";
      default-fragments = "2";
      default-fragment-size-msec = "125";
      resample-method = "soxr-vhq";
      enable-lfe-remixing = "no";
      high-priority = "yes";
      nice-level = "-11";
      realtime-scheduling = "yes";
      realtime-priority = "9";
      rlimit-rtprio = "9";
      daemonize = "no";
    };
  };
  home-manager.users.skandix = {
    home.packages = with pkgs; [
      pamixer
      pasystray
    ];
  };
}
