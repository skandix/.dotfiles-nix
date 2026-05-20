{ pkgs, ... }:

{
  home-manager.users.hx = {
    services.udiskie = {
      enable = true;
      notify = true;
      automount = true;
      tray = "always";
    };
  };
}
