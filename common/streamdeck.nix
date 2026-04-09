{ pkgs, unstable, ... }:

{
  programs.streamcontroller = {
    enable = true;
    package = unstable.streamcontroller;
  };
}
