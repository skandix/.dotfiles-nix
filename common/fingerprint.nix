{ config, pkgs, ... }:

{
  services.fprintd = {
    enable = true;
  };
}
