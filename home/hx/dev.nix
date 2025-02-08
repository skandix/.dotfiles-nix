{ pkgs, ... }:

{
  imports = [
    ./hm/configurations/git
  ];

  home.sessionPath = [ "$HOME/.go/bin" "$HOME/.local/bin" "$HOME/.cargo/bin" ];

  home-manager.users.hx = {
    home.packages = with pkgs;
    [
      (python313.withPackages
        (ps: with ps; [
          neovim
          requests
          setuptools
          pip
          loguru
          pandas
        ]))
      rustup
      go
      poetry
      uv
      ruff
    ];
  };
}
