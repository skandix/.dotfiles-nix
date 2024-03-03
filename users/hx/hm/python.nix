{ pkgs, ... }:

{
  home-manager.users.hx = {
    home.packages = with pkgs;
      [
        (python311.withPackages
          (ps: with ps; [ neovim requests setuptools pip pipenv loguru ]))
      ];
  };
}
