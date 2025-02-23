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
    ../../home/hx/sway

    # Common
    ../../common/amdcpu.nix
    ../../common/amdgpu.nix
    ../../common/docker.nix
    ../../common/fonts.nix
    ../../common/games.nix
    ../../common/networkmanager.nix
    ../../common/pipewire.nix
    ../../common/nix-tweakz.nix
    ../../common/nix-pkg-allow.nix
    ../../common/virtualization.nix
    ../../common/fwupd.nix
    ../../common/zsh.nix
    ../../common/ssh-client.nix
    ../../common/streamdeck.nix
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg.unstable) [
     "sublimetext4"
  ];

  nixpkgs.config.allowUnfree = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  systemd.network.wait-online.enable = lib.mkForce false; # to avoid iface or vbox waiting for connection.
  systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;
  systemd.network.netdevs.wlp6s0.enable = false;
  networking.hostName = "TheOrville";
  networking.useDHCP = false;
  networking.interfaces.enp5s0.useDHCP = true;
  networking.interfaces.wlp6s0.useDHCP = lib.mkForce false;

  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    keyMap = "no";
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  time.timeZone = "Europe/Oslo";
  home-manager.users.hx.home.stateVersion = "24.11";
  system.stateVersion = "24.11";
}
