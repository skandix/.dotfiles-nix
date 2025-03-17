{ pkgs, unstable, ... }:

{
  home-manager.users.hx = {
    home.packages = with unstable; [
      rustup
    ];
  };
}
