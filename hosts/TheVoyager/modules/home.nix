{ ... }:

{
  imports = [
    ../../../home/hx/hm/configurations/zsh
    ../../../home/hx/hm/configurations/git
    ../../../home/hx/hm/configurations/mpv
    ../../../home/hx/hm/configurations/tmux
    ../../../home/hx/hm/configurations/vim
  ];

  programs.home-manager.enable = true;

  home = {
    username = "hx";
    homeDirectory = "/Users/hx";
    stateVersion = "26.05";

    sessionVariables = {
      PAGER = "less";
      BROWSER = "librewolf";
      TERMINAL = "ghostty";
    };
  };
}
