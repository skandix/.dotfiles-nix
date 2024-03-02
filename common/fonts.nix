{ config, pkgs, ... }:

{
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-color-emoji
      nerdfonts
      liberation_ttf
      fira-code-symbols
      dina-font
      symbola
    ];
    fontconfig = { enable = true; };
  };
}
