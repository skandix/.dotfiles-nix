{pkgs, ...}:

{
  imports = [
    ../dunst
    ../picom
    ../flameshot
    ../rofi
    ../alacritty
    ../mpv
  ];

  services.xserver = {
    enable = true;
    layout = "no";
    autorun = true;
    libinput.enable = true;
  };

  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.defaultSession = "none+i3";
  services.xserver.windowManager.i3 = {
    enable = true;
    package = pkgs.i3;
    extraPackages = with pkgs; [
      pkg-config
      xclip
      arandr
      feh
      i3blocks
    ];
  };

  home-manager.users.skandix = {
    xdg.configFile = {
      "i3/config".source = ./i3_config;
      "i3/rnd_bg".source = ./rnd_bg.sh;
      "i3blocks/config".source = ./i3blocks_config;
      "i3blocks/battery-poly".source = ./battery-poly;
    };
  };
}
