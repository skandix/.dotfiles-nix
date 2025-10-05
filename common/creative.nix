{
  config,
  pkgs,
  unstable,
  lib,
  ...
}:

{
  environment.systemPackages = with pkgs; [
      unstable.blender
      unstable.unityhub
  ];
}
