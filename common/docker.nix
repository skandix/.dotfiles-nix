{
  unstable,
  ...
}:

{
  virtualisation.docker = {
    enable = true;
    package = unstable.docker;
    enableOnBoot = true;
    liveRestore = true;
  };

  environment.systemPackages = [ unstable.docker-compose ];
}
