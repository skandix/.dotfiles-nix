{pkgs, ...}:

{
  # To set up Sway using Home Manager, first you must enable Polkit in your nix configuration: 
  security.polkit.enable = true;
  
  # Then you can enable Sway in your home manager configuration. Here is a minimal example: 
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      terminal = "alacritty"; 
      startup = [
        {command = "firefox";}
      ];
    };
  };
}