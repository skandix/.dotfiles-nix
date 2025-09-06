{ config, pkgs, unstable, ... }:

{
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "both";
    #openFirewall = true;
    interfaceName = "ts0";
    package = unstable.tailscale;
  };
}
