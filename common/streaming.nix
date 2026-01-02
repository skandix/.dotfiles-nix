{ config, pkgs, unstable, ... }:


{
  programs.obs-studio = {
    enable = true;

    enablevirtualcamera = true;

    plugins = with unstable.obs-studio-plugins; [
      distroav
      obs-vaapi #optional amd hardware acceleration
    ];
  };

  environment.systempackages = with pkgs; [
    unstable.ndi-6
  ];
}
