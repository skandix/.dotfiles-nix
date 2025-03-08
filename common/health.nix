{ pkgs, ... }:

{
  programs.coolercontrol = {
    enable = true;
    nvidiaSupport = true;
  };
  environment.systemPackages = with pkgs; [
    lm_sensors
    smartmontools
  ];
}
