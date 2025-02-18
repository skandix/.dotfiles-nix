{ config, ... }:

{
  networking.nameservers = [
    "8.8.8.8"
    "8.8.4.4"
  ];
  networking.enableIPv6 = true;
  networking.wireguard = {
    enable = true;
  };

  services.tailscale = {
    enable = true;
    useRoutingFeatures = "both";
    openFirewall = true;
    interfaceName = "ts0";
  };
}
