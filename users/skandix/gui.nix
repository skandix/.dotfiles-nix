{ config, pkgs, ... }:

{
  home-manager.users.skandix = {
    imports = [
     ./confs/i3/default.nix
  ];

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
  };
}
