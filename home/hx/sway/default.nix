{ pkgs, unstable, ... }:

{
  imports = [
    ./../hm/configurations/flameshot
    ./../hm/configurations/tofi
    ./../hm/configurations/wpaperd
    ./../hm/configurations/librewolf
    ./../hm/configurations/alacritty
  ];

  programs.xwayland = {
    enable = true;
  };

  programs.sway = {
    enable = true;
    wrapperFeatures = {
      base = true;
      gtk = true;
  };

    extraPackages = with pkgs; [
      waybar
      grim
      sway-contrib.grimshot
      slurp
      swaylock
      swayidle
      swaybg
      waypaper
      wdisplays
      feh
      i3blocks
      mako
    ];
  };


  # for working tray applets (source: fbegyn)
  environment.variables = {
    XDG_CURRENT_DESKTOP="sway";
    XDG_SESSION_DESKTOP="sway";
    XDG_SESSION_TYPE = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "0";
    QT_QPA_PLATFORM = "wayland";
    QT_SCALE_FACTOR = "1";
    GDK_SCALE = "1";
    GDK_DPI_SCALE = "1";
    MOZ_ENABLE_WAYLAND = "1";
    _JAVA_AWT_WM_NONREPARENTING = "1";
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
  };

  home-manager.users.hx = {
    xdg.configFile = {
      "sway/config".source = ./sway_config;
      "i3blocks/config".source = ./i3blocks;
      "waypaper/config.ini".source = ./waypaper_config;
    };
  };

  # Have to set this here as ghostty is a bit buggy on wayland per. now
  environment.variables = {
    TERMINAL = "alacritty";
  };
}
