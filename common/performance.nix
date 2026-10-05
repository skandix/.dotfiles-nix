{ lib, ... }:

{

  virtualisation.docker.enableOnBoot = false;
  documentation.nixos.enable = false;

  # zram tweaks
  boot = {
    loader.timeout = 1;
    kernel.sysctl = {
      "vm.swappiness" = 180;
      "vm.page-cluster" = 0;
      "vm.watermark_boost_factor" = 0;
      "vm.watermark_scale_factor" = 125;
    };
  };

  nix = {
    daemonCPUSchedPolicy = "idle";
    daemonIOSchedClass = "idle";
  };

  systemd = {
    services.NetworkManager-wait-online.enable = lib.mkForce false;
    oomd.enableUserSlices = true;
  };

  services = {
    scx = {
      enable = true;
      scheduler = "scx_lavd";
    };
    fstrim = {
      enable = true;
    };
  };
}
