{ config, ... }:

{
  # Enable nvidia-docker
  #imports = [
    #../nvidia-docker.nix
  #];

  # nvidia driver
  nixpkgs.config.allowUnfree = true;
  services.xserver.videoDrivers = [ "nvidia" ];
}
