{
  unstable,
  ...
}:

{
  virtualisation.docker = {
    enable = true;
    package = unstable.docker;
    liveRestore = true;
  };

  environment.systemPackages = [ unstable.docker-compose ];
}
