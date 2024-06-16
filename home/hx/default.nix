{ config, pkgs, ... }:

{
  imports = [ ./ssh.nix ];

  environment.variables = {
    PAGER = "less";
    BROWSER = "firefox";
    EDITOR = "vim";
    SHELL = "zsh";
  };
}
