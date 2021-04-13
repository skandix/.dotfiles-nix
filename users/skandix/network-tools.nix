{config, pkgs, ...}:

{
  home.packages = with pkgs; [
    traceroute
    ldns
    mtr
    nmap
  ]
}
