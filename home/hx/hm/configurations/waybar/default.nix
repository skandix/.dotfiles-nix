{ pkgs, ... }:

{
  home-manager.users.hx = {
    programs.waybar = {
      enable = true;
      style = ''
        * {
            font-family: "Terminus", monospace;
            font-size: 12px;
            min-height: 0;
        }

        window#waybar {
            background-color: rgba(0, 0, 0, 0.85);
            color: #ffffff;
            border-bottom: 1px solid #333;
        }

        .modules-left > widget,
        .modules-center > widget,
        .modules-right > widget {
            padding: 0 6px;
        }

        #tags button {
            padding: 0 6px;
            color: #888;
            background: transparent;
            border-bottom: 2px solid transparent;
        }
        #tags button.occupied {
            color: #ffffff;
        }
        #tags button.focused {
            color: #ffffff;
            border-bottom: 2px solid #ff00ff;
        }
        #tags button.urgent {
            color: #ff0000;
        }

        #window {
            color: #cccccc;
            font-style: italic;
        }


        #custom-public-ip {
            color: #ff0000;
        }

        #network {
            color: #00ff00;
        }

        #disk,
        #memory {
            color: #ff00ff;
        }

        #custom-weather {
            color: #A4C2F4;
        }

        #clock {
            color: #ff00ff;
        }

        #pulseaudio.muted {
            color: #888888;
        }

        #tray {
            padding: 0 4px;
        }
      '';
      settings = [{
          "layer": "top",
          "position": "top",
          "height": 28,
          "spacing": 4,

          "modules-left": ["dwl/tags", "dwl/window"],
          "modules-center": ["custom/beats"],
          "modules-right": [
              "custom/uptime",
              "pulseaudio",
              "custom/public-ip",
              "network",
              "custom/load",
              "disk",
              "memory",
              "custom/weather",
              "clock",
              "tray"
          ],

          "dwl/tags": {
              "num-tags": 9
          },
          "dwl/window": {
              "max-length": 60
          },

          "custom/beats": {
              "exec": "echo \"$(, playerctl metadata artist 2>/dev/null) - $(, playerctl metadata title 2>/dev/null)\"",
              "interval": 2,
              "max-length": 60,
              "tooltip": false
          },

          "custom/uptime": {
              "exec": "uptime | cut -d' ' -f2",
              "interval": 60,
              "format": "up {}",
              "tooltip": false
          },

          "pulseaudio": {
              "format": "Volume {volume}%",
              "format-muted": "Volume muted",
              "on-click": "pavucontrol"
          },

          "custom/public-ip": {
              "exec": "curl -s https://icanhazip.com",
              "interval": 300,
              "format": "public {}",
              "tooltip": false
          },

          "network": {
              "format-ethernet": "{ipaddr}",
              "format-wifi": "{ipaddr}",
              "format-disconnected": "no network",
              "tooltip-format": "{ifname} — {ipaddr}/{cidr}"
          },

          "custom/load": {
              "exec": "uptime | awk -F'load average:' '{print $2}' | xargs",
              "interval": 5,
              "tooltip": false
          },

          "disk": {
              "interval": 30,
              "format": "Disk: {free}/{total}",
              "path": "/"
          },

          "memory": {
              "interval": 5,
              "format": "RAM: {used:0.1f}G/{total:0.1f}G"
          },

          "custom/weather": {
              "exec": "curl -Ss 'https://wttr.in/Grimstad?format=2'",
              "interval": 1800,
              "tooltip": false
          },

          "clock": {
              "format": " {:%a, %d %b - %H:%M:%S} ",
              "interval": 1,
              "tooltip-format": "<tt><small>{calendar}</small></tt>"
          },

          "tray": {
              "icon-size": 18,
              "spacing": 8
          }
        }];
    };
  };
}
