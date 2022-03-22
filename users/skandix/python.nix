{ pkgs, ... }:

{
  home.packages = with pkgs;
  [
    (python310.withPackages
      (ps: with ps; [
        neovim
        setuptools
        pip
        virtualenv
        pipenv
        binwalk
        ]
      )
    )
  ];
}