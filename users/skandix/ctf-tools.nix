{configs, pkgs,  ...}:

{
  home.packages = with pkgs; [
    sonic-visualiser
    # unstable.volatility
    unstable.ghidra-bin
    hexedit
    strace
    ltrace
    msitools
  ];
}
