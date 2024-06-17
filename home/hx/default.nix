{ config, pkgs, ... }:

{
  environment.variables = {
    PAGER = "less";
    BROWSER = "firefox";
    EDITOR = "vim";
    SHELL = "fish";
  };
}
