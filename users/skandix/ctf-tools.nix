{configs, pkgs,  ...}:

{
  home.packages = with pkgs; [
    binwalk
    ghidra-bin
    sonic-visualiser
    steghide
    volatility
  ];
}
