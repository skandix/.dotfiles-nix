{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
  };


  #home-manager.users.hx = {
    home.packages = with pkgs; [
      zinit
    ];
    home.file.zshrc = {
      source = ./.zshrc;
      target = ".zshrc";
    };
  #};
}
