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
    ../../common/nix-pkg-allow.nix
    ../../common/nix-tweakz.nix
    ../../common/ssh-client.nix
    ../../common/virtualization.nix
    ../../common/health.nix
  ];

  networking.hostName = "Narcissus";
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
  nixpkgs.hostPlatform = "x86_64-linux";
}
