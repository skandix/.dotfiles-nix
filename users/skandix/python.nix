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
        pandas
        loguru
        urllib3
        boto3
        requests_oauthlib
        python-dotenv
        untangle
      ]
      )
    )
  ];
}
