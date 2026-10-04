{ config, pkgs, ... }:

{
  environment.variables = {
    PAGER = "less";
    BROWSER = "librewolf";
    #EDITOR = "vim";
    SHELL = "zsh";
    TERM = "xterm-256color";
    XSECURELOCK_SAVER = "saver_xscreensaver xsecurelock";
    TERMRC = "$HOME/.taskrc";
  };
}
