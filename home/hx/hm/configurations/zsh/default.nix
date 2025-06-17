{ config, pkgs, ... }:

{
  #programs.zsh.enable = true;


  #home-manager.users.hx = {
    home.packages = with pkgs; [
      pfetch
      lolcat
      zinit
    ];
    home.file.zshrc = {
      source = ./.zshrc;
      target = ".zshrc";
    };
  #};
}
