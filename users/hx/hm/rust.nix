{ pkgs, ... }:

{
  home-manager.users.hx = {
    home.packages = with pkgs; [ rustup rustfmt ];
  };
}

