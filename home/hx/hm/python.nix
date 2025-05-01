{ pkgs, unstable, ... }:

{
  home-manager.users.hx = {
    programs = {
      ruff = {
      enable = true;
    };
    poetry = {
      enable = true;
    };
  };
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
    ];
  };
  #programs.nix-ld.enable = true;
  #programs.nix-ld.libraries = with pkgs; [
    ## Add any missing dynamic libraries for unpackaged programs
    ## here, NOT in environment.systemPackages
  #];
}
