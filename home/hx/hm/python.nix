{ pkgs, unstable, ... }:

{
  home-manager.users.hx = {
    home.packages = with pkgs; [
      (python312.withPackages (
        ps: with ps; [
          neovim
          requests
          setuptools
          loguru
          aiohttp
          beautifulsoup4
        ]
      ))
      unstable.uv
      unstable.ruff
    ];
  };
  programs = {
    nix-ld = {
      enable = true; # needs to be enabled for uv to work
    };
  };
}
