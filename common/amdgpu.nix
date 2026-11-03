{ pkgs, ... }:

{
  boot.initrd.kernelModules = [ "amdgpu" ];
  hardware.graphics.enable = true;
  environment.systemPackages = with pkgs; [
    vulkan-tools
  ];
}
