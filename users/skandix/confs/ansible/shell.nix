## cf https://nixos.org/manual/nix/stable/command-ref/nix-shell.html
let
  nixpkgs-version = "21.11";
  pkgs = import (fetchTarball
    #"https://github.com/NixOS/nixpkgs/archive/refs/tags/${nixpkgs-version}.tar.gz") {};
    "https://github.com/NixOS/nixpkgs/archive/nixos-${nixpkgs-version}.tar.gz") {};
in
  pkgs.mkShell {
    name = "poetry-ansible-oscaro";
    buildInputs = [
      # Change your python version here
      (pkgs.python39.withPackages (pp: with pp; [poetry]))
      # Add non-python packages here
    ];
    shellHook = ''
      python -m venv .venv
      if [[ ! -f "pyproject.toml" ]]; then
        poetry init -n
      fi
      poetry env use .venv/bin/python
      poetry install --no-root
      source ./.venv/bin/activate
      ## ansible cannot be installed with poetry yet.
      ## so we use pip and pin the version
      pip install 'ansible==5.1.0'
      pip install 'ansible-lint==5.4.0'
    '';
  }