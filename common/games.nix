{ config, pkgs, ... }:

{
  # ST2EAM
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
    driSupport = true;
    #extraPackages = with pkgs.pkgsi686Linux; [ libva ];
    extraPackages = with pkgs; [ rocm-opencl-icd rocm-opencl-runtime ];
  };
  hardware.pulseaudio.support32Bit = true;
  hardware.steam-hardware.enable = true;
  programs.steam.enable = true;

  # OTHER
  environment.systemPackages = with pkgs; [
    lutris
    #bottles
    winetricks
    instawow
    wine-staging
    gamemode
    mangohud
    r2modman
  ];
}
