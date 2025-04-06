{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    package = pkgs.tmux;
    sensibleOnTop = true;
    newSession = true;
    secureSocket = true;
  };
  home.file = {
    ".tmux.conf".source = ./tmux.conf;
  };
}
