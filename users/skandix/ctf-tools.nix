{configs, pkgs,  ...}:

{
  home.packages = with pkgs; [
    unstable.ghidra-bin
    sonic-visualiser
    unstable.volatility
    unstable.ghidra-bin
    hexedit
    strace
    ltrace
    msitools
  ];
}
