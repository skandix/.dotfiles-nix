{
  config,
  pkgs,
  unstable,
  ...
}:

{
  environment.systemPackages = with pkgs; [
      unstable.blender
      unstable.unityhub
  ];
}
