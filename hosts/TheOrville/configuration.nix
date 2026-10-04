{
  config,
  pkgs,
  lib,
  unstable,
  ...
}:

{
  imports = [
    # Hardware udev rules
    ./hardware-configuration.nix

    # core dotfiles + graphical things
    ../../home
    ../../home/hx
    ../../home/hx/gui.nix
    ../../home/hx/cli.nix
    ../../home/hx/dev.nix
    ../../home/hx/mango

    # Common
    ../../common/amdcpu.nix
    ../../common/amdgpu.nix
    ../../common/docker.nix
    ../../common/fonts.nix
    ../../common/games.nix
    ../../common/networkmanager.nix
    ../../common/creative.nix
    ../../common/pipewire.nix
    ../../common/nix-tweakz.nix
    ../../common/tailscale.nix
    ../../common/nix-pkg-allow.nix
    ../../common/fwupd.nix
    ../../common/ssh-client.nix
    ../../common/streamdeck.nix
    ../../common/virtualization.nix
    ../../common/ctf.nix
    ../../common/vj.nix
    ../../common/printing.nix
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

  systemd.network.wait-online.enable = lib.mkForce false; # to avoid iface or vbox waiting for connection.
  systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;
  systemd.network.netdevs.wlp6s0.enable = false;

  networking = {
    hostName = "TheOrville";
    hostId = "ec097b34";

    interfaces = {
      enp5s0.useDHCP = true;
      wlp6s0.useDHCP = lib.mkForce false;
    };
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  home-manager.users.hx.home.stateVersion = "26.05";
  system.stateVersion = "26.05";
}
