{
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./disk-config.nix

    ../../home/hx
    ../../home/hx/cli.nix
    ../../home/hx/dev.nix

    ../../common/amdcpu.nix
    ../../common/docker.nix
    ../../common/networkmanager.nix
    ../../common/tailscale.nix
    ../../common/nix-pkg-allow.nix
    ../../common/nix-tweakz.nix
    ../../common/ctf.nix
    ../../common/ssh-client.nix
    ../../common/sshd.nix
    ../../common/autoUpgrade.nix
  ];

  environment.etc."ssh/banner".source = ./ssh_banner;

  services = {
    openssh.settings.Banner = "/etc/ssh/banner";
    qemuGuest.enable = true;
  };

  boot.loader = {
    grub = {
      enable = true;
      efiSupport = true;
      efiInstallAsRemovable = true;
      devices = [ "/dev/vda" ];
    };
    #systemd-boot = {
    #enable = true;
    #editor = false;

    #};
    #efi = {
    #canTouchEfiVariables = false;
    #};
  };

  users.users.birch = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "docker"
    ];
    home = "/home/birch";
    initialPassword = "hunter2k"; # used for build-vm and init deployment of nixos-anywhere
  };

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
  };

  networking = {
    hostName = "Lynx";
    useDHCP = false;
    interfaces = {
      ens3 = {
        useDHCP = true;
      };
    };
    hostId = "666dc31b";
    firewall = {
      enable = true;
      allowedTCPPorts = [
        80
        443
        22
      ];
      allowedUDPPorts = [
        80
        443
      ];
    };
  };

  home-manager.users.hx.home.stateVersion = "26.05";
  system.stateVersion = "26.05";
}
