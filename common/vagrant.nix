{ config, pkgs, ... }:

{
  virtualisation.virtualbox = {
    host = {
      enable = true;
    };
    guest.enable = true;
  };

  home-manager.users.skandix = {
    home.packages = with pkgs; [
      vagrant
    ];
  };
}
