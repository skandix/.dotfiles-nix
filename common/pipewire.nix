{ config, pkgs, unstable, ... }:

{
  # rtkit is optional but recommended
  security.rtkit.enable = false;

  services = {
    pipewire = {
      enable = true;
      package = unstable.pipewire;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      audio.enable = true;
    };

    #wireplumber = {
      #enable = true;
    #};

  };
  environment.systemPackages = with pkgs; [
    helvum
    pamixer
    pasystray
    pulseaudio
    pavucontrol
    easyeffects
  ];
}
