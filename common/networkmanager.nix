{ config, pkgs, ... }:

{
  networking = {
    enableIPv6 = true;
    networkmanager = {
      enable = true;
    };

    wireguard = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    networkmanager
    networkmanagerapplet
    nm-tray
    wireguard-tools
    dig
    traceroute
    mtr
    tcpdump
    speedtest-cli
  ];
}
