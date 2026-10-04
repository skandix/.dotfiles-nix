{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    #bambu-studio
    openscad
    meshlab
  ];
}
