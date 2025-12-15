{pkgs, ...}:

{
  imports = [
    ./hm/go.nix
    ./hm/python.nix
    ./hm/rust.nix
  ];

  environment.systemPackages = with pkgs; [
    gnumake
    act
    libgcc
  ];
}
