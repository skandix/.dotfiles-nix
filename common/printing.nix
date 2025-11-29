{
  config,
  pkgs,
  unstable,
  lib,
  ...
}:

{
  environment.systemPackages = with pkgs; [
      bambu-studio
      openscad
      meshlab
  ];
}
