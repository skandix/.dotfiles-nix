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
  services.pulseaudio.support32Bit = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    protontricks.enable = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  # OTHER
  environment.systemPackages = with pkgs; [
    lutris
    winetricks
    bottles
    wine-staging
    winePackages.stagingFull
    gamemode # Optimise Linux system performance on demand
    mangohud # A Vulkan and OpenGL overlay for monitoring FPS, temperatures, CPU/GPU load and more.
    r2modman # risk of rain 2 mod manager
    protontricks
    prismlauncher # minecraft launcher
    wowup-cf # wow addoon manager
    protonplus
  ];
}
