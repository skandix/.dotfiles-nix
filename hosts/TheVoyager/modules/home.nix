{ unstable, config, pkgs, ... }:

{

  imports = [
    ../../../home/hx/hm/configurations/fish
    ../../../home/hx/hm/configurations/git
    ../../../home/hx/hm/configurations/mpv/macos.nix
    ../../../home/hx/hm/configurations/tmux/macos.nix
    ../../../home/hx/hm/configurations/vim/macos.nix
  ];

  programs = {
    home-manager = {
      enable = true;
    };
  };

  home = {
    username = "hx";
    homeDirectory = "/Users/hx";
    stateVersion = "25.11";

    sessionVariables = {
      PAGER = "less";
      BROWSER = "librewolf";
      EDITOR = "vim";
      SHELL = "zsh";
      TERMINAL = "ghostty";
    };
  };
}
