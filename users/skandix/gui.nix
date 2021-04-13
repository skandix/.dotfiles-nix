{ config, pkgs, ... }:

{
  imports = [
    ./confs/i3
  ]

  home.packages = with pkgs; [
    slack
    discord
    tdesktop
    spotify
    firefox
    rofi
    vscode
    pavucontrol
  ];
}
