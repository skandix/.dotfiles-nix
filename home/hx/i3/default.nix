{ pkgs, ... }:

{
  imports = [
    ./../hm/configurations/dunst
    ./../hm/configurations/flameshot
    ./../hm/configurations/picom
    ./../hm/configurations/rofi
    #./../hm/configurations/librewolf
    ./../hm/configurations/alacritty
  ];

  services = {
    xserver = {
      enable = true;
      autorun = true;
      xkb.layout = "no";

      displayManager.lightdm = {
        enable = true;
        #greeters.enso.enable = true;
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
          pywal
          xsecurelock
        ];
      };
      #extraConfig = ''
        #Section "ServerFlags"
        #Option          "BlankTime"     "0"
        #Option          "StandbyTime"   "0"
        #Option          "SuspendTime"   "0"
        #Option          "OffTime"       "0"
        #Option "dpms" "false"

        #EndSection
      #'';
    };
    libinput.enable = true;
    displayManager.defaultSession = "none+i3";
  };
  home-manager.users.hx = {
    xdg.configFile = {
      "i3/config".source = ./i3_config;
      "i3blocks/config".source = ./i3blocks;
    };
  };

  environment.variables = {
    TERMINAL = "alacritty";
  };
}
