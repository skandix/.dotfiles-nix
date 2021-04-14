{pkgs, ...}:

{
  # since i3 is somewhat synonymous with graphical applications, i want to keep all imports here related
  # to things that need a screen to show things .
  imports = [
    ../dunst
    ../picom
    ../flameshot
    ../rofi
    ../pulse
    ../alacritty
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
      autorandr
      feh
      i3blocks
    ];
    /* don't think this is the way it should be done
    services.xserver.autorun = [
      picom
      dunst
    ]*/
  };


  home-manager.users.skandix = {
    xdg.configFile = {
      "i3/config".source = ./i3_config;
      "i3blocks/config".source = ./i3blocks_config;
    };
  };
}
