{ pkgs, ... }:

{
  home-manager.users.hx = {
    programs.waybar = {
      enable = true;
      style = ''
        * {
            font-size: 16px;
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
            padding: 0 0px;
        }

        #tags button {
            padding: 0 4px;
            color: #888;
            background: transparent;
            border-bottom: 2px solid transparent;
        }

        #tags button.occupied {
            color: #ffffff;
        }

        #tags button.focused {
            color: #ffffff;
            border-bottom: 4px solid #ff00ff;
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

        #pulseaudio.muted {
            color: #ff0000;
        }

        #tray {
            padding: 0 4px;
        }

        #privacy-item {
          color: #ff0000;
        }

        #custom-seperator {
          color: #ff00ff;
        }

        .modules-right > widget > * {
          margin-right: 10px;
        }
      '';

      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 24;
          spacing = 2;

          modules-left = [ "dwl/tags" ];
          modules-center = [ "custom/seperator" "custom/beats" "custom/seperator" ];
          modules-right = [
            "custom/seperator"
            "privacy"
            "custom/seperator"
            "pulseaudio"
            "custom/seperator"
            "custom/public-ip"
            "custom/seperator"
            "network"
            "custom/seperator"
            "cpu"
            "custom/seperator"
            "memory"
            "custom/seperator"
            "disk"
            "custom/seperator"
            "clock"
            "custom/seperator"
            "tray"
          ];

          "dwl/tags" = { num-tags = 9; };
          #"dwl/window" = { max-length = 0; };

          "custom/beats" = {
            exec = ''echo "$(playerctl metadata artist 2>/dev/null) - $(playerctl metadata title 2>/dev/null)"'';
            interval = 2;
            max-length = 60;
            tooltip = false;
          };

          # OMEGA HACKY; but if anyone know how to fix, plz show me
          "custom/seperator" = {
            format = "λ";
            interval = "once";
            tooltip = false;
          };

          pulseaudio = {
            format = "Volume: {volume}%";
            format-muted = "Volume muted";
            on-click = "pavucontrol";
          };

          privacy = {
            icon-spacing = 2;
            transition-duration = 250;
            modules = [
              {
			    type = "screenshare";
			    tooltip = true;
			    tooltip-icon-size = 24;
        	  }
		      {
			    type = "audio-out";
			    tooltip = true;
			    tooltip-icon-size = 24;
		      }
		      {
			    type = "audio-in";
			    tooltip = true;
		    	tooltip-icon-size = 24;
              }
        ];
      };

          "custom/public-ip" = {
            exec = "curl -s https://icanhazip.com";
            interval = 1;
            format = "{}";
            tooltip = false;
          };

          network = {
            format-ethernet = "{ipaddr}";
            format-wifi = "{ipaddr}";
            format-disconnected = "NO NETWORK 👀";
            tooltip-format = "{ifname} — {ipaddr}/{cidr}";
            interval = 1;
          };

          cpu = {
            interval = 10;
            format = "🧠: {}%";
            max-length = 10;
          };

          disk = {
            interval = 30;
            format = "💾: {free}";
          };

          memory = {
            interval = 5;
            format = ":🐏: {used:0.1f}G";
          };

          clock = {
            format = " {:%a, %d %b - %H:%M:%S} ";
            interval = 1;
            tooltip-format = "<tt><medium>{calendar}</medium></tt>";
            timezone = "Europe/Oslo";
          };

          tray = {
            icon-size = 24;
            spacing = 12;
          };
        };
      };
    };
  };
}
