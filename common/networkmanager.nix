{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs.unstable; [
    networkmanager
    networkmanagerapplet
    networkmanager-openvpn
    networkmanager-openconnect
    openvpn
  ];
}
