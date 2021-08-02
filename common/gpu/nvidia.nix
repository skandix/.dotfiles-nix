{ config, ... }:

{
  # Enable nvidia-docker
  #imports = [
    #../nvidia-docker.nix
  #];

  # nvidia driver
  services.xserver.videoDrivers = [ "nvidia" ];
}
