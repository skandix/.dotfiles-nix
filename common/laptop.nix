{config, pkgs, ...}:

{
    environment.systemPackages = with pkgs; [
      powertop
      tlp
      brightnessctl
      light
    ];
}
