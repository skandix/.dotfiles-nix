{ config, pkgs, ... }:

{
  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      nerd-fonts-fira-code
      ttf-opensans
      liberation_ttf
      fira-code-symbols
      dina-font
      symbola
      # (nerdfonts.override { fonts = [
      #     "FiraCode"
      #     "DejaVuSansMono"
      #   ];}
      # )
    ];
    fontconfig = {
      enable = true;
    };
  };
}
