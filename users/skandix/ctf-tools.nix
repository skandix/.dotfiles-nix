{configs, pkgs,  ...}:

{
  home.packages = with pkgs; [
    unstable.ghidra-bin
    sonic-visualiser
    unstable.volatility
    ghidra-bin
    hexedit
    strace
    ltrace
  ];
}
