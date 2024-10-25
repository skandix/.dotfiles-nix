{ config, pkgs, ...}:

{

  # imports = [
  #   ../../home/hx/hm/base.nix
  # ];
  home.stateVersion = "24.05";

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