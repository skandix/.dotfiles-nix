{ pkgs, unstable, ... }:

{
  home.packages = with unstable; [
    rustup
  ];
}
