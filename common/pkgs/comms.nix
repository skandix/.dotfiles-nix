{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
      tdesktop
      signal-desktop
      mumble
      teams-for-linux
      slack
    ];
}