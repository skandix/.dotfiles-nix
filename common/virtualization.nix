{ config, pkgs, ... }:

{
  virtualisation = {
    libvirtd = {
      enable = true;
      onBoot = "ignore";
      onShutdown = "shutdown";
    };
  };


  environment.systemPackages = with pkgs; [
    #virtio-win
    qemu
    vagrant
  ];
}
