{ config, pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  hardware.pulseaudio.support32Bit = true;
  programs.steam.enable = true;
  services.ratbagd.enable = true;

  # OTHER
  environment.systemPackages = with pkgs; [
    lutris
    winetricks
    wine-staging
    gamemode
    mangohud
    r2modman
    protontricks
    piper
    logitech-udev-rules
    solaar
    runelite
    prismlauncher
  ];
}
