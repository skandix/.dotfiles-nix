{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
    ];
    fontconfig = { enable = true; };
  };
}
