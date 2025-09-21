{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    obs-studio-plugins.distroav
    ndi-6
    obs-studio
  ];
}
