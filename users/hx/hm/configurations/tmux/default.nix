{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    package = pkgs.unstable.tmux;
    sensibleOnTop = true;
    newSession = true;
    secureSocket = true;
  };
  home.file = { "files/tmux.conf".source = ./tmux.conf; };
}
