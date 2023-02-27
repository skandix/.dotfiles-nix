{config, pkgs, ...}:

{
  home-manager.users.hx = {
    home.packages = with pkgs; [
      powertop
      tlp
      brightnessctl
      light
    ];
  };
}
