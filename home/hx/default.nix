{ config, pkgs, ... }:

{
  environment.variables = {
    PAGER = "less";
    BROWSER = "librewolf";
    EDITOR = "vim";
    SHELL = "fish";
    TERMINAL = "ghostty";
  };
}
