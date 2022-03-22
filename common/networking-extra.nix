{config, ...}:

{
  networking.nameservers = [
    "1.1.1.1"
    "8.8.8.8"
  ];
  networking.enableIPv6 = true;
}
