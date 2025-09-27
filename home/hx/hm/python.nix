{ pkgs, unstable, ... }:

{
  home-manager.users.hx = {
    home.packages = with pkgs; [
      (python312.withPackages (
        ps: with ps; [
          neovim
          requests
          setuptools
          pip
          loguru
          aiohttp
          beautifulsoup4
        ]
      ))
      unstable.uv
      unstable.ruff
      unstable.poetry
    ];
  };
  programs = {
    nix-ld = {
      enable = true; # needs to be enabled for uv to work
      #libraries = with pkgs; [
        ## Add any missing dynamic libraries for unpackaged programs
        ## here, NOT in environment.systemPackages
      #];
    };
  };
}
