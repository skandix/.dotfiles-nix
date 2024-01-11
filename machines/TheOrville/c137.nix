  { config, ... }:

{
    networking.wg-quick.interfaces = {
    c137 = {
      address = [ "10.13.37.51/32" ];
      privateKeyFile = "/home/skandix/.wireguard/privatekey";
      peers = [
        {
          publicKey = "M6gihpWC+yX8J2XsAn/fBj9SwtwonVN9utq4zKTk6W0=";
          allowedIPs = [ "0.0.0.0/0" ];
          endpoint = "128.39.145.70:52345";
          persistentKeepalive = 25;
        }
      ];
    };
  };
}
