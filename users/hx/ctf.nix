{configs, pkgs,  ...}:

{
  home.packages = with pkgs; [
    ghidra-bin
    sonic-visualiser
    volatility
    hexedit
    strace
    ltrace
    burpsuite
    netcat-gnu
    gobuster
    thc-hydra
    john
    metasploit-framework
    msfpc
    nmap
    seclists
    sqlmap
    wpscan
    binwalk
    # msitools
  ];
}
