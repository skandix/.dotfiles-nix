{config, pkgs, ...}:

{
  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    extraConfig = ''
      unload-module module-role-cork
    '';
  };
  home-manager.users.skandix = {
    home.packages = with pkgs; [
      pamixer
      pasystray
    ];
  };
}
