{ config, pkgs, ... }:

{
  services.fprintd = {
    enable = true;
    package = with pkgs; [ fprintd ];
  };
}
