{ pkgs, ... }:

{
  home.packages = with pkgs;
  [
    (python38.withPackages
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
