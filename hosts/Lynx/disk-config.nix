{lib, ...}:

{
  disko.devices = {
    disk.main = {
        device = lib.mkDefault "/dev/vda";
        type = "disk";
        content = {
          type = "gpt";

          partitions = {
            boot = {
              size = "16M";
              type = "EF20";
            };

            ESP = {
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };

            root = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
          };
        };
    };
  };
}
