{ config, pkgs, ... }:

{
  # rtkit is optional but recommended
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # - The option definition `services.pipewire.config' in `/nix/store/x9gwkh7dh3vl4dghnvcf1b4wddwbbr60-source/common/pipewire.nix' no longer has any effect; please remove it.
    #   Overriding default PipeWire configuration through NixOS options never worked correctly and is no longer supported.
    #   Please create drop-in configuration files via `services.pipewire.extraConfig` instead.
    # config.pipewire-pulse = {
    #   "context.properties" = { "log.level" = 2; };
    #   "context.modules" = [
    #     {
    #       name = "libpipewire-module-rtkit";
    #       args = {
    #         "nice.level" = -15;
    #         "rt.prio" = 88;
    #         "rt.time.soft" = 200000;
    #         "rt.time.hard" = 200000;
    #       };
    #       flags = [ "ifexists" "nofail" ];
    #     }
    #     { name = "libpipewire-module-protocol-native"; }
    #     { name = "libpipewire-module-client-node"; }
    #     { name = "libpipewire-module-adapter"; }
    #     { name = "libpipewire-module-metadata"; }
    #     {
    #       name = "libpipewire-module-protocol-pulse";
    #       args = {
    #         "pulse.min.req" = "32/48000";
    #         "pulse.default.req" = "32/48000";
    #         "pulse.max.req" = "32/48000";
    #         "pulse.min.quantum" = "32/48000";
    #         "pulse.max.quantum" = "32/48000";
    #         "server.address" = [ "unix:native" ];
    #       };
    #     }
    #   ];
    #   "stream.properties" = {
    #     "node.latency" = "32/48000";
    #     "resample.quality" = 1;
    #   };
    # };
  };
  environment.systemPackages = with pkgs; [
    helvum
    pamixer
    pasystray
    pulseaudio
    pavucontrol
    #easyeffects
  ];
}
