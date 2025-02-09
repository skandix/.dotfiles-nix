{ pkgs, unstable, ... }:

{
  imports = [
    ./../hm/configurations/flameshot
    ./../hm/configurations/wofi
    ./../hm/configurations/librewolf
    ./../hm/configurations/alacritty
  ];

  programs.sway = {
    enable = true;
    wrapperFeatures = {
      base = true;
      gtk = true;
    xwayland = {
      enable = true;
    };
  };

    extraPackages = with pkgs; [
      waybar
      grim
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
