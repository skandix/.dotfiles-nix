{ config, pkgs, ... }:

{

  imports = [
    ../../../home/hx/hm/configurations/fish
    ../../../home/hx/hm/configurations/git
    ../../../home/hx/hm/configurations/mpv
    ../../../home/hx/hm/configurations/tmux
    ../../../home/hx/hm/configurations/vim
  ];

  time.timeZone = "Europe/Oslo"
  programs = {
    home-manager = {
      enable = true;
    };
  };

  home = {
    username = "skandix";
    homeDirectory = "/Users/skandix";
    stateVersion = "24.11";

    sessionVariables = {
      PAGER = "less";
      BROWSER = "librewolf";
      EDITOR = "vim";
      SHELL = "fish";
      TERMINAL = "ghostty";
    };
  }; 
}