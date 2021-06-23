{config, pkgs, ...}:

{

  networking.firewall.allowedTCPPorts = [
    8080
    8443
  ];

  services.unifi = {
    enable = true;
    unifiPackage = pkgs.unifi;
  };
}
