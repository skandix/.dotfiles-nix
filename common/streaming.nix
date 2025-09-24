{ config, pkgs, unstable, ... }:


{
  programs.obs-studio = {
    enable = true;

    enableVirtualCamera = true;

    plugins = with unstable.obs-studio-plugins; [
      distroav
      obs-vaapi #optional AMD hardware acceleration
    ];
  };

  environment.systemPackages = with pkgs; [
    unstable.ndi-6
  ];
}
