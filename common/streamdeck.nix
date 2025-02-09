{ pkgs, ... }:

{
  programs.streamdeck-ui = {
    enable = true;
    autoStart = true;
  };
}
