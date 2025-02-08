{ pkgs, ... }:

{
  home-manager.users.hx = {
    home.packages = with pkgs;
    [
      (python313.withPackages
        (ps: with ps; [
          neovim
          requests
          setuptools
          pip
          loguru
        ]))
      poetry
      uv
      ruff
    ];
  };
}
