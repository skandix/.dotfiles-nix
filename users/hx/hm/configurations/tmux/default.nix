{ pkgs, ... }:

{
  home-manager.users.hx = {
    programs.tmux = {
      enable = true;
      package = pkgs.tmux;
      sensibleOnTop = true;
      newSession = true;
      secureSocket = true;
    };
    home.file = { "files/tmux.conf".source = ./tmux.conf; };
  };
}
