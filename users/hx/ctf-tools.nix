{configs, pkgs,  ...}:

{
  home.packages = with pkgs; [
    sonic-visualiser
    # volatility
    ghidra-bin
    hexedit
    strace
    ltrace
    msitools
  ];
}
