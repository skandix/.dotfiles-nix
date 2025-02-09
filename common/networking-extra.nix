{ config, ... }:

{
  networking.nameservers = [
    "1.1.1.1"
    "1.0.0.1"
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
