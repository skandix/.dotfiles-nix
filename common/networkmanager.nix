{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    networkmanager
    networkmanagerapplet
    # networkmanager-openvpn
    # networkmanager-openconnect
    # openvpn
  ];
}
