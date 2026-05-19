{ pkgs, ... }:

{
  home-manager.users.hx = {
    programs.mangohud = {
      enable = true;
      enableSessionWide = false;
    };
    # TODO: add config inline
    xdg.configFile = {
      "MangoHud/MangoHud.conf".source = ./MangoHud.conf;
    };
  };
}
