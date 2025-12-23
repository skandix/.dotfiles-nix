{ config, pkgs, ... }:

{
  services.vscode-server = {
    enable = true;
    enableFHS = true;
  };
}
