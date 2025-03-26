{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    powertop
    tlp
    brightnessctl
    light
  ];
  services.xserver.synaptics = {
    enable = true;
    minSpeed = 0.4;
    maxSpeed = 0.8;
    palmDetect = true;
    accelFactor = 0;
  };
}
