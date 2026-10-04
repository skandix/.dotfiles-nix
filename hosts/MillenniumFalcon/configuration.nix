{
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix

    ../../home/hx
    ../../home/hx/cli.nix
    ../../home/hx/dev.nix

    ../../common/intelcpu.nix
    ../../common/intelgpu.nix
    ../../common/networkmanager.nix
    ../../common/tailscale.nix
    ../../common/sshd.nix
    ../../common/docker.nix
    ../../common/nix-pkg-allow.nix
    ../../common/fwupd.nix
    ../../common/nix-tweakz.nix
    ../../common/ssh-client.nix
    ../../common/health.nix
    ../../common/autoUpgrade.nix
  ];

  environment.etc."ssh/banner".source = ./ssh_banner;
  services.openssh.settings.Banner = "/etc/ssh/banner";

  environment.systemPackages = with pkgs; [
    chromium # needed to export slides
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
    hostName = "MillenniumFalcon";
    hostId = "876927e2";

    interfaces.eno1.useDHCP = true;
  };

  home-manager.users.hx.home.stateVersion = "26.05";
  system.stateVersion = "26.05";
}
