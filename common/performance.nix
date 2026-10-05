{ ... }:

{
  boot.loader.timeout = 1;
  systemd.oomd.enableUserSlices = true;
  documentation.nixos.enable = false;

  services = {
    scx = {
      enable = true;
      scheduler = "scx_lavd";
    };
    fstrim = {
      enable = true;
    };
  };

  # nix build run at lowest priority so it does not make the desktop lag
  nix = {
    daemonCPUSchedPolicy = "idle";
    daemonIOSchedClass = "idle";
  };

  # zram tweaks
  boot.kernel.sysctl = {
    "vm.swappiness" = 180;
    "vm.page-cluster" = 0;
    "vm.watermark_boost_factor" = 0;
    "vm.watermark_scale_factor" = 125;
  };

}
