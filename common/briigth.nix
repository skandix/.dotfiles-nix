{config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    brightnessctl
    light
  ];
}
