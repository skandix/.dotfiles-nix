{ config, unstable, pkgs, ... }:

{
  virtualisation = {
    cores = 4;
    useEFIBoot = true;

    spiceUSBRedirection.enable = true;

    libvirtd = {
      enable = true;
      onBoot = "ignore";
      onShutdown = "shutdown";
    };

    virt-manager = {
      enable = true;
    };

    qemu = {
      package = unstable.qemu_kvm;
      foreceAccel = true;
    };
  };

  services = {
    qemuGuest = {
      enable = true;
    };

    spice-vdagentd = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    virtio-win
    qemu
    spice-gtk
    vagrant
  ];
}
