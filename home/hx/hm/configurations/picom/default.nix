{ pkgs, ... }:

{
  home-manager.users.hx = {
    home.packages = with pkgs; [ fastcompmgr ];

    #xdg.configFile = {
      #"picom/picom.conf".source = ./picom.conf;
    #};
  };
}
