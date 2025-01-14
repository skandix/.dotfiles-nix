{ pkgs, ... }:

{
  home-manager.users.hx = {
    home.packages = with pkgs;
    [
      (python312.withPackages
        (ps: with ps; [
          neovim
          requests
          setuptools
          pip
          pipenv
          loguru
          pipenv
          pandas
          tabulate
        ]))
      rustup
      go
      #poetry
      uv
      ruff
    ];
  };
}
