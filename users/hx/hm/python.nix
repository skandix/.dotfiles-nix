{ pkgs, ... }:

{
  home.packages = with pkgs.unstable;
  [
    (python311.withPackages
      (ps: with ps; [
        neovim
        requests
        setuptools
        pip
        pipenv
        binwalk
        loguru
      ]))
  ];
}
