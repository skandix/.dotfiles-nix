{pkgs, unstable, ...}:

{

  home-manager.users.hx.imports = [
    ./hm/go.nix
    ./hm/python.nix
    ./hm/rust.nix
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
