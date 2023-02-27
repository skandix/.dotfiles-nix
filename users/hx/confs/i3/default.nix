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
  services.xserver.extraConfig = ''
    Section "ServerFlags"
    Option          "BlankTime"     "0"
    Option          "StandbyTime"   "0"
    Option          "SuspendTime"   "0"
    Option          "OffTime"       "0"
    Option "dpms" "false"

    EndSection
  '';

  home-manager.users.hx = {
    xdg.configFile = {
      "i3/config".source = ./i3_config;
      "i3/rnd_bg".source = ./rnd_bg.sh;
      "i3blocks/config".source = ./i3blocks_config;
      "i3blocks/battery-poly".source = ./battery-poly;
    };
  };
}
