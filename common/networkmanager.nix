{ pkgs, ... }:

{
  networking.networkmanager.enable = true;
  home-manager.users.hx = {
    home.packages = with pkgs; [
        networkmanager
        networkmanagerapplet
        networkmanager-openvpn
        networkmanager-openconnect
        openvpn
    ];
  };
}
