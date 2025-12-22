{
  # example "/dev/sda"
  disk = "/dev/vda";

  disko.devices = {
    # boot
    disk = {
      type = "disk";
      device = disk;
      content = {
        type = "gpt";
        partitions = {
          esp = {
            size = "512MiB";
            type = "EF00";
            name = "boot";
            bootable = true;
            filesystem = {
              type = "vfat";
              mountpoint = "/boot";
              label = "boot";
            };
          };

          # nixos root
          nixos = {
            start = "512MiB";
            end = "-200MiB";
            type = "8300";
            name = "nixos";
            filesystem = {
              type = "ext4";
              mountpoint = "/mnt";
              label = "nixos";
            };
          };

          # swap partition
          swap = {
            start = "-200MiB";
            end = "100%";
            type = "8200";
            name = "swap";
            filesystem = {
              type = "swap";
              label = "swap";
            };
          };

        };
      };
    };
  };
}
