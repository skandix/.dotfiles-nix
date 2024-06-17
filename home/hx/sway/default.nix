{pkgs, ...}:

{
  programs.sway = {
    enable = true;
  };
  programs.waybar = {
    enable = true;
  };
  home-manager.users.hx = {
    xdg.configFile = {
      "sway/config".source = ./sway_config;
    };
  };
}