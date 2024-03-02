{ pkgs, ... }:

{
  home-manager.users.hx = {
    home.packages = with pkgs; [ rustc cargo rustfmt ];
  };
}

