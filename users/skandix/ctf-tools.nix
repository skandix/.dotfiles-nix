{configs, pkgs,  ...}:

{
  home.packages = with pkgs; [
    binwalk
    unstable.ghidra-bin
    sonic-visualiser
    steghide
    unstable.volatility
  ];
}
