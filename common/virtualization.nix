{ config, unstable, pkgs, ... }:

{
  programs = {
    virt-manager = {
      enable = true;
    };
  };

  virtualisation = {
    #useEFIBoot = true;
    #spiceUSBRedirection.enable = true;

    libvirtd = {
      enable = true;
      onBoot = "ignore";
      onShutdown = "shutdown";
    };


    #qemu = {
      #foreceAccel = true;
    #};
  };

  environment.systemPackages = with pkgs; [
    virtio-win
    qemu
    spice-gtk
    vagrant
  ];
}
