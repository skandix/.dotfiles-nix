{ config, pkgs, ... }:

{
  services.sshd = { enable = true; };
}
