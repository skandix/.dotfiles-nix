{ config, pkgs, ... }:

{
  virtualisation.virtualbox = {
    host = {
      enable = true;
      enableExtensionPack = true;
    };
  };
  users.extraGroups.vboxusers.members = ["skandix"];

  home-manager.users.skandix = {
    home.packages = with pkgs; [
      unstable.vagrant
    ];
  };
}
