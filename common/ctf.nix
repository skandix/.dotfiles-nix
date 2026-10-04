{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    jadx
    quark-engine
    binaryninja-free
    volatility3
    ltrace
    strace
  ];
}
