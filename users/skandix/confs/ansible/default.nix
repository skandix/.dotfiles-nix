{ config, pkgs, lib, ...}: {
  home.file."Documents/shell.nix".source = ./shell.nix;
  home.file."Documents/pyproject.toml".source = ./pyproject.toml;
  ## not sure if i should add poetry.lock file
  home.file."Documents/poetry.lock.backup".source = ./poetry.lock;
  home.file."Documents/.envrc".text = "use nix";
}