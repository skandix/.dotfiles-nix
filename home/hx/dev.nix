{ pkgs, ... }:

{

  home-manager.users.hx.imports = [
    ./modules/go.nix
    ./modules/python.nix
    ./modules/rust.nix
  ];

  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
    gnumake
    libgcc
    gcc
    cmake
    act
    nodejs_24
    yarn
    shellcheck
  ];
}
