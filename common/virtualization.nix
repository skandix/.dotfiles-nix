{
  pkgs,
  ...
}:

{
  programs = {
    virt-manager = {
      enable = true;
    };
  };

  virtualisation = {
    libvirtd = {
      enable = true;
      onBoot = "ignore";
      onShutdown = "shutdown";
    };
  };

  environment.systemPackages = with pkgs; [
    virtio-win
    qemu
    spice-gtk
    vagrant
  ];
}
