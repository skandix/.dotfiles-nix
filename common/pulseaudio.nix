{config, pkgs, ...}:

{
  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
    extraModules = [ pkgs.pulseaudio-modules-bt ];
    extraConfig = ''
      unload-module module-role-cork
      unload-module module-switch-on-connect
      unload-module module-switch-on-port-available
    '';
  };
  home-manager.users.skandix = {
    home.packages = with pkgs; [
      pamixer
      pasystray
    ];
  };
}
