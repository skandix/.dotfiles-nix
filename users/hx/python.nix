{ pkgs, ... }:

{
  home.packages = with pkgs;
  [
    (python39.withPackages
      (ps: with ps; [
        neovim
        requests
        setuptools
        pip
        #virtualenv
        pipenv
        binwalk
        loguru
        #pandas
        #urllib3
        #boto3
        #requests_oauthlib
        #python-dotenv
      ]
      )
    )
  ];
}
