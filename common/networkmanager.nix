{ config, pkgs, ... }:

{
  #networking.nameservers = [
    #"8.8.8.8"
    #"8.8.4.4"
  #];
  networking.enableIPv6 = true;
  networking.wireguard = {
    enable = false;
  };

  services.tailscale = {
    enable = true;
    useRoutingFeatures = "both";
    openFirewall = true;
    interfaceName = "ts0";
  };
  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    networkmanager
    networkmanagerapplet
    networkmanager-openvpn
    openvpn
    networkmanager-openconnect
    openconnect
    nm-tray
    wireguard-tools
  ];
}
