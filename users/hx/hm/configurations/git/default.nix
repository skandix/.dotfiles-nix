{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    config = {
      user = {
        name = "Bendik";
        email = "skandix@protonmail.com";
      };
    };
  };
}
