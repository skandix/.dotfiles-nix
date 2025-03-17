{ pkgs, ... }:

{
  home-manager.users.hx = {
    home.packages = with pkgs.unstable; [
      rustup
      rust-analyzer
    ];
  };
}
