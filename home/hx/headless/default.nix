{ pkgs, ... }:

{
  imports = [
    ./../hm/configurations/vim
    ./../hm/configurations/tmux
    ./../hm/go.nix
    ./../hm/python.nix
    ./../hm/rust.nix
  ];

  environment.variables = {
    TERMINAL = "xterm-256color"; # so stuff don't shit the bed when they see a ghost
  };
}
