{ ... }:

{
  imports = [
    ../../../home/hx/modules/zsh
    ../../../home/hx/modules/git
    ../../../home/hx/modules/mpv
    ../../../home/hx/modules/tmux
    ../../../home/hx/modules/vim
    ../../../home/hx/modules/ghostty
  ];

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
