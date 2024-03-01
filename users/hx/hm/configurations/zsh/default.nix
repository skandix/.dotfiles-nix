{ config, pkgs, ... }:

{
  imports = [ ../tmux ];

  home.packages = with pkgs; [ zsh pfetch lolcat zinit ];

  home.file.bashrc = {
    source = ./.zshrc;
    target = ".zshrc";
  };
}
