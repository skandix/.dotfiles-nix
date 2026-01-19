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
    ../../home/hx/i3
    #../../home/hx/sway # 7.december, not in the mood to fix bugs and issues, lets try this another time

    # Common
    #../../common/virtualbox.nix
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
    ../../common/autoUpgrade.nix
    ../../common/ctf.nix
    ../../common/vj.nix
    ../../common/printing.nix
    ../../common/storage-devices.nix
    ../../common/vscodium.nix
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

  home-manager.users.hx.home.stateVersion = "25.11";
  system.stateVersion = "25.11";
}
