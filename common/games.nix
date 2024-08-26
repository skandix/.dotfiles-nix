{ config, pkgs, unstable, ... }:

{
  nixpkgs.config.allowUnfree = true;
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
    driSupport = true;
  };
  hardware.pulseaudio.support32Bit = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # OTHER
  environment.systemPackages = with pkgs; [
    unstable.lutris
    unstable.winetricks
    wine-staging
    gamemode
    mangohud
    r2modman
    unstable.protontricks
  ];
}
