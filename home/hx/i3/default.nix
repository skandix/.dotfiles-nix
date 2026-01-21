{ pkgs, ... }:

{
  imports = [
    ./../hm/configurations/dunst
    ./../hm/configurations/flameshot
    ./../hm/configurations/picom
    ./../hm/configurations/rofi
    ./../hm/configurations/ghostty
    ./../hm/configurations/mpv
    ./../hm/configurations/discord
    ./../hm/configurations/vim
    ./../hm/configurations/mangohud
    ./../hm/configurations/tmux
    ./../hm/configurations/udiskie
    #./../hm/configurations/vscodium
    ./../hm/go.nix
    ./../hm/python.nix
    ./../hm/rust.nix
  ];

  services = {
    xserver = {
      enable = true;
      autorun = true;
      xkb.layout = "no";

      displayManager.lightdm = {
        enable = true;
      };

      windowManager.i3 = {
        enable = true;
        package = pkgs.i3;
        extraPackages = with pkgs; [
          pkg-config
          xclip
          arandr
          feh
          i3blocks
          xsecurelock
          libnotify
          inotify-tools
        ];
      };
    };
    displayManager.defaultSession = "none+i3";
  };
  home-manager.users.hx = {
    xdg.configFile = {
      "i3/config".source = ./i3_config;
      "i3blocks/config".source = ./i3blocks;
    };
  };


  xdg.portal = {
    enable = true;
    wlr.enable = false;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
    config = {
      common.default = "*";
    };
  };

  environment.variables = {
    TERMINAL = "xterm-256color"; # so stuff don't shit the bed when they see a ghost
  };
}
