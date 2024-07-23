{ config, pkgs, ... }:

{
  virtualisation.virtualbox = {
    host = {
      enable = true;
      enableExtensionPack = true;
    };
  };
  environment.systemPackages = with pkgs; [ vagrant ];
}
