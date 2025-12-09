{ pkgs, ... }:

{
  home-manager.users.hx = {
    services.udiskie = {
      enable = true;
      notify = true;
      automount = true;
      tray = "always";
      #settings = {
          #program_options = {
              #file_manager = "${pkgs.nemo-with-extensions}/bin/nemo";
          #};
      #};
    };
  };
}
