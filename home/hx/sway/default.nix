{pkgs, ...}:

{
  programs.sway = {
    enable = true;
    extraPackages = with pkgs; [ 
      waypaper
      swaybg
     ];
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
