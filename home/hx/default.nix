{ config, pkgs, ... }:

{
  environment.variables = {
    PAGER = "less";
    BROWSER = "librewolf";
    EDITOR = "vim";
    SHELL = "fish";
    TERM = "xterm-256color";
    XSECURELOCK_SAVER = "saver_xscreensaver xsecurelock";
  };
}
