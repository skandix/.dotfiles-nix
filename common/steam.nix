{ config, pkgs, ... }:

{
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
    extraPackages32 = with pkgs.pkgsi686Linux; [ libva  ];
  };
  hardware.pulseaudio.support32Bit = true;
  hardware.steam-hardware.enable = true;
  programs.steam.enable = true;
}

