{pkgs, ...}:

{
  services.xserver= {
    enable = true;
    layout = "no";
    libinput.enable = true;
  };

  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.defaultSession = "none+i3";
  services.xserver.windowManager.i3 = {
    enable = true;
    package = pkgs.i3;
    extraPackages = with pkgs; [
      flameshot
      pkg-config
      xclip
      arandr
      autorandr
      picom
      feh
      i3blocks
    ];
  };


  home-manager.users.skandix = {
    xdg.configFile = {
      "i3/config".source = ./i3_config;
      "i3blocks/config".source = ./i3blocks_config;
    };
  };
}
