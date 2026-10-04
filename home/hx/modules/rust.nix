{ unstable, ... }:

{
  home = {
    packages = with unstable; [
      rustup
    ];

    sessionPath = [ "$HOME/.cargo/bin" ];
  };
}
