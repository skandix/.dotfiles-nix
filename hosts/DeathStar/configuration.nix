{
  ...
}:

{
  imports = [
    # Hardware udev rules
    ./hardware-configuration.nix

    # core dotfiles + graphical things
    ../../home/hx/gui.nix
    ../../home/hx/cli.nix
    ../../home/hx/dev.nix
    ../../home/hx/wm/mango

    # Common
    ../../common/intelcpu.nix
    ../../common/nvidiagpu.nix
    ../../common/docker.nix
    ../../common/fonts.nix
    ../../common/tailscale.nix
    ../../common/networkmanager.nix
    ../../common/nix-pkg-allow.nix
    ../../common/pipewire.nix
    ../../common/fwupd.nix
    ../../common/nix-tweakz.nix
    ../../common/ssh-client.nix
    ../../common/health.nix
    ../../common/storage-devices.nix
  ];

  boot.loader = {
    systemd-boot = {
      enable = true;
      editor = false;
    };
    efi = {
      canTouchEfiVariables = false;
    };
  };

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
  };

  networking = {
    hostName = "DeathStar";
    hostId = "c464a368";

    interfaces.eno1.useDHCP = true;
  };

  home-manager.users.hx.home.stateVersion = "26.05";
  system.stateVersion = "26.05";
}
