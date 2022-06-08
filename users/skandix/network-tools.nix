{config, pkgs, ...}:

{
  home.packages = with pkgs; [
    traceroute
    ldns
    mtr
    nmap
    wireshark
    tcpdump
    speedtest-cli
    netcat-gnu
  ];
}