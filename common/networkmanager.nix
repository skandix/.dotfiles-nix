{ pkgs, ... }:

{
  networking.networkmanager.enable = true;
  home-manager.users.hx = {
    home.packages = with pkgs; [
        networkmanagerapplet
        networkmanager-openvpn
        networkmanager
    ];
  };
}
