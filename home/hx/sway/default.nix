{pkgs, ...}:

{
  imports = [
    #./../hm/configurations/dunst # not sure if i need this anymore
    ./../hm/configurations/flameshot
    ./../hm/configurations/wofi # rofi replacement for wayland
    ./../hm/configurations/librewolf
  ];

  programs.sway = {
    enable = true;
    extraPackages = with pkgs; [
      swaybg
      wrandr
      feh
      i3blocks
      pywal
     ];
  };

  #programs.waybar = {
    #enable = true;
  #};

  home-manager.users.hx = {
    xdg.configFile = {
      "sway/config".source = ./sway_config;
      "i3blocks/config".source = ./i3blocks;
    };
  };
}
