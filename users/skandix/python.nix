{ pkgs, ... }:

{
  home.packages = with pkgs.unstable;
  [
    (python310.withPackages
      (ps: with ps; [
        neovim
        requests
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
