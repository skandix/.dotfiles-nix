{
  unstable,
  ...
}:

{
  virtualisation.docker = {
    enable = true;
    package = unstable.docker;
    enableOnBoot = false;
    liveRestore = true;
  };

  environment.systemPackages = [ unstable.docker-compose ];
}
