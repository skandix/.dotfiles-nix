{ pkgs, ... }:

{
  networking.networkmanager.enable = true;
  home-manager.users.skandix = {
    home.packages = with pkgs; [
        networkmanagerapplet
        networkmanager-openvpn
        networkmanager
    ];
  };
}
