{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    history.path = "$HOME/.histfile";
    initContent = builtins.readFile ./.zshrc;
  };


    home.packages = with pkgs; [
      zinit
    ];
}
