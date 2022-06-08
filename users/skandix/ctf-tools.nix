{configs, pkgs,  ...}:

{
  home.packages = with pkgs; [
    sonic-visualiser
    # unstable.volatility
    ghidra-bin
    hexedit
    strace
    ltrace
    msitools
  ];
}
