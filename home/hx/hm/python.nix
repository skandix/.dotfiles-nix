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
          #uv
          #ruff
        ]
      ))
      unstable.poetry
    ];
  };
}
