{ inputs, config, pkgs, ... }:

{
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
    ] ++ (with inputs.nixos-fonts.packages.x86_64-linux; [
      anzu-moji
      azukifont
      rii-tegaki-fude
    ]);
    fontconfig = {
      enable = true;
    };
  };
}
