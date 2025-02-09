{ config, pkgs, ... }:

{

  imports = [
    ../../../home/
    ../../../home/hx/
    ../../../home/hx/hm/configurations/zsh
    ../../../home/hx/hm/configurations/vim
    ../../../home/hx/hm/configurations/tmux
  ];
  home.stateVersion = "24.11";

  home.file = {
    ".vimrc".source = "../../../home/hx/hm/"
      }


      home.sessionVariables = {
      PAGER = "less";
    BROWSER = "librewolf";
    EDITOR = "vim";
    SHELL = "fish";
    # TERMINAL = "alacritty";
  };
  programs.home-manager.enable = true;
}
