{ config, pkgs, ... }:

{
  virtualisation.virtualbox = {
    host = {
      enable = true;
      enableExtensionPack = true;
    };
    guest = {
      enable = true;
    };
  };
  environment.systemPackages = with pkgs; [ vagrant ];
}
