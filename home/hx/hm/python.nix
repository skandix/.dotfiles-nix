{ pkgs, unstable, ... }:

{
  home.packages = with pkgs; [
    unstable.uv
    unstable.ruff
    python314
  ];
}
