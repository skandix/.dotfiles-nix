{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../users
      ../../users/skandix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "SpaceCruiser";
  

  networking.useDHCP = false;
  networking.interfaces.enp0s31f6.useDHCP = true;
  networking.interfaces.wlp0s20f3.useDHCP = true;
  # networking.wireless.enable = true;

  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "no";
  };

  time.timeZone = "Europe/Oslo";

  services.xserver.enable = true;
  services.xserver.autorun = true;
  services.xserver.desktopManager.xterm.enable = false;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.defaultSession = "none+i3";
  services.xserver.windowManager.i3.enable = true;

  nixpkgs.config.allowUnfree = true;
  services.xserver.layout = "no";
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  services.xserver.libinput.enable = true;

  environment.systemPackages = with pkgs; [
    wget
   # vim
   # firefox
   # discord
   # neovim
    git
    htop
   # rofi
    neofetch
    spotify
   # pfetch
    pulsemixer
   # alacritty
   # i3blocks
   # networkmanager
   # nm-tray
  ];

  services.openssh.enable = true;
  networking.firewall.enable = false;
  system.stateVersion = "20.09";
}
