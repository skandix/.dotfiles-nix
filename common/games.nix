{
  config,
  pkgs,
  unstable,
  ...
}:

{

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services = {
    pulseaudio.support32Bit = true;
    flatpak.enable = true;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    protontricks.enable = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  #environment.sessionVariables = {
    #STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      #”\${HOME}/.steam/root/compatibilitytools.d”;
  #};

  programs = {
    gamemode = {
      enable = true;
      settings = {
        custom = {
          start = "${pkgs.libnotify}/bin/notify-send 'GameMode started'";
          end = "${pkgs.libnotify}/bin/notify-send 'GameMode ended'";
        };
      };
    };
  };

  # Remember
  # - Bottles did not work good without flatpak, why it is not listed here


  # OTHER
  environment.systemPackages = with pkgs; [
    lutris
    winetricks # wine
    wine-staging # wine
    winePackages.stagingFull # wine
    r2modman # risk of rain 2 mod manager
    protontricks # winetricks but with proton
    prismlauncher # minecraft launcher
    unstable.wowup-cf # wow addoon manager
    protonplus # proton manager
    wivrn
    osu-lazer-bin
  ];

  # services.wivrn = {
  #   enable = true;
  #   openFirewall = true;

  #   # Write information to /etc/xdg/openxr/1/active_runtime.json, VR applications
  #   # will automatically read this and work with WiVRn (Note: This does not currently
  #   # apply for games run in Valve's Proton)
  #     defaultRuntime = true;

  #   # Run WiVRn as a systemd service on startup
  #   autoStart = true;

  #   # Config for WiVRn (https://github.com/WiVRn/WiVRn/blob/master/docs/configuration.md)
  #   config = {
  #     enable = true;
  #     json = {
  #       # 1.0x foveation scaling
  #       scale = 1.0;
  #       # 100 Mb/s
  #       bitrate = 100000000;
  #       encoders = [
  #         {
  #           encoder = "vaapi";
  #           codec = "h265";
  #           # 1.0 x 1.0 scaling
  #           width = 1.0;
  #           height = 1.0;
  #           offset_x = 0.0;
  #           offset_y = 0.0;
  #         }
  #       ];
  #     };
  #   };
  # };

  # programs.envision = {
  #   enable = true;
  #   openFirewall = true; # This is set true by default
  # };

}
