{ config, pkgs, ...}:

{

  imports = [
    ../../../home/hx/hm/configurations/zsh
  ];
  home.stateVersion = "24.11";

  home.file = {
    ".vimrc".source = ../
  }


  home.sessionVariables = {
    PAGER = "less";
    BROWSER = "librewolf";
    EDITOR = "vim";
    # SHELL = "fish";
    # TERMINAL = "alacritty";
  };
  programs.home-manager.enable = true;
}