{ pkgs, ... }:

{
  networking.networkmanager.enable = true;
  home-manager.users.skandix = {
    home.packages = with pkgs; [
        gnome3.networkmanagerapplet
        networkmanager_openvpn
        networkmanager
    ];
  };
}
