{ pkgs, unstable, ... }:

{
  home-manager.users.hx = {
    home.packages = with pkgs; [
      unstable.uv
      unstable.ruff
      python314
    ];
  };
  programs = {
    nix-ld = {
      enable = true; # needs to be enabled for uv to work
    };
  };
}
