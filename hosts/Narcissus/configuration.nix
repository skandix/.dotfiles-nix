{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    #./hardware-configuration.nix
    ./gandicloud.nix
    ../../home
    ../../home/hx
    ../../home/hx/cli.nix
    ../../home/hx/dev.nix

    ../../common/intelcpu.nix
    ../../common/sshd.nix
    ../../common/docker.nix
    ../../common/tailscale.nix
    ../../common/nix-pkg-allow.nix
    ../../common/nix-tweakz.nix
    ../../common/ssh-client.nix
    ../../common/tailscale.nix
    ../../common/autoUpgrade.nix
  ];

  networking.hostName = "Narcissus";
  programs.dconf.enable = true; # TODO: hvorfor trenger jeg denne her?
  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    keyMap = "no";
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  time.timeZone = "Europe/Oslo";
  home-manager.users.hx.home.stateVersion = "25.11";
  nixpkgs.hostPlatform = "x86_64-linux";
}
