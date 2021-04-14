{pkgs, ...}:

{
  xdg.configFile = {
    "gtk-3.0/settings.ini".source = ./settings.ini;
  };
}
