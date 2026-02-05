{pkgs, unstable, ...}:

{
  imports = [
    ./hm/go.nix
    ./hm/python.nix
    #./hm/rust.nix
  ];

  environment.systemPackages = with pkgs; [
    gnumake
    libgcc
    gcc
    cmake
    extra-cmake-modules
    act
    nodejs_24
    yarn
  ];
}
