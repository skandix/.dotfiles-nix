{ config, pkgs, lib, ... }:

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
    ../../home/hx/i3

    # Common
    ../../common/intelcpu.nix
    ../../common/fingerprint.nix
    ../../common/laptop.nix
    ../../common/intelgpu.nix
    ../../common/tailscale.nix
    ../../common/docker.nix
    ../../common/fonts.nix
    ../../common/networkmanager.nix
    ../../common/pipewire.nix
    ../../common/nix-tweakz.nix
    ../../common/nix-pkg-allow.nix
    ../../common/fwupd.nix
    ../../common/ssh-client.nix
    ../../common/autoUpgrade.nix
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
  };

  networking = {
    hostName = "SpaceCruiser";
    hostId = "d15ac040";

    interfaces = {
      enp5s0.useDHCP = false;
      wlp6s0.useDHCP = false;
    };
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  home-manager.users.hx.home.stateVersion = "25.11";
  system.stateVersion = "25.11";
}
