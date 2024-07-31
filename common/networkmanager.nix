{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    networkmanager
    networkmanagerapplet
    networkmanager-openvpn
    openvpn
    networkmanager-openconnect
    openconnect
    nm-tray
  ];
}
