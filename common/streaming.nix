{ pkgs, unstable, ... }:

{
  environment.systemPackages = with pkgs; [
    unstable.obs-studio-plugins.distroav
    #unstable.ndi-6
    obs-studio
  ];
}
