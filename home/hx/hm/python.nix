{ pkgs, unstable, ... }:

{
  home-manager.users.hx = {
    home.packages = with pkgs; [
      unstable.uv
      unstable.ruff
      python313
      python313Packages.pycryptodome
      python313Packages.cryptography
    ];
  };
  programs = {
    nix-ld = {
      enable = true; # needs to be enabled for uv to work
    };
  };
}
