{ config, pkgs, ... }:

{
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "both";
    #openFirewall = true;
    interfaceName = "ts0";
  };
}
