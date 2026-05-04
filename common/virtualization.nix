{ config, pkgs, ... }:

{
  virtualisation = {
    libvirtd = {
      enable = true;
      onBoot = "ignore";
      onShutdown = "shutdown";
    };

    #qemu = {
      #package = pkgs.qemu_kvm;
      #runAsRoot = true;
    #};
  };


  environment.systemPackages = with pkgs; [
    #virtio-win
    qemu
    vagrant
  ];
}
