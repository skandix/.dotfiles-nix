{
  config,
  pkgs,
  unstable,
  ...
}:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  hardware.pulseaudio.support32Bit = true;
  programs.steam.enable = true;
  services.ratbagd.enable = true;


  nixpkgs.config.allowUnfree = true;

  # OTHER
  environment.systemPackages = with pkgs; [
    lutris
    winetricks
    wine-staging
    gamemode # Optimise Linux system performance on demand
    mangohud # A Vulkan and OpenGL overlay for monitoring FPS, temperatures, CPU/GPU load and more.
    r2modman # risk of rain 2 mod manager
    protontricks
    piper
    logitech-udev-rules
    solaar
    prismlauncher # minecraft launcher
    wowup-cf # wow addoon manager
    unstable.protonup-qt
    #proton-ge-bin # uncomment until resolved issues with package
    unstable.sublime4
  ];
}
