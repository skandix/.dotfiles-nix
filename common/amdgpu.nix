{ config, pkgs, ... }:

{
  boot.initrd.kernelModules = [ "amdgpu" ];
  hardware.graphics.enable = true;
}
