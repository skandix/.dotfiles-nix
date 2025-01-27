{ pkgs, ... }:

{
  imports = [
    ./../hm/configurations/dunst
    ./../hm/configurations/flameshot
    ./../hm/configurations/picom
    ./../hm/configurations/rofi
    ./../hm/configurations/librewolf
    #./../hm/configurations/firefox
  ];

  services.xserver = {
    enable = true;
    autorun = true;
    xkb.layout = "no";
  };
  services.libinput.enable = true;
  services.xserver.displayManager.lightdm = {
    enable = true;
    greeters.enso.enable = true;
  };
  services.displayManager.defaultSession = "none+i3";
  services.xserver.windowManager.i3 = {
    enable = true;
    package = pkgs.i3;
    extraPackages = with pkgs; [ pkg-config xclip arandr feh i3blocks pywal ];
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
      "i3blocks/config".source = ./i3blocks;
      "i3blocks/docker".source = ./scripts/docker;
    };
  };
}
