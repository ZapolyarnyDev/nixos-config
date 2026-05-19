{
  programs.waybar = {
    enable = true;

    settings.mainBar = {
      layer = "top";
      position = "top";
      height = 34;
      margin = "8 12 0";

      modules-left = [
        "hyprland/workspaces"
      ];

      modules-center = [
        "clock"
      ];

      modules-right = [
        "tray"
        "network"
        "pulseaudio"
        "backlight"
        "battery"
      ];

      "hyprland/workspaces" = {
        disable-scroll = true;
        format = "{icon}";
        format-icons = {
          "1" = "1";
          "2" = "2";
          "3" = "3";
          "4" = "4";
          "5" = "5";
          urgent = "!";
          active = "●";
          default = "○";
        };
        persistent-workspaces = {
          "*" = 5;
        };
      };

      clock = {
        format = "{:%H:%M}";
        format-alt = "{:%A, %d %B %Y}";
        tooltip-format = "<tt>{calendar}</tt>";
        calendar = {
          mode = "month";
          weeks-pos = "right";
        };
      };

      tray = {
        icon-size = 16;
        spacing = 10;
      };

      network = {
        format-wifi = "󰤨  {essid}";
        format-ethernet = "󰈀  wired";
        format-disconnected = "󰤭  offline";
        tooltip-format = "{ifname}: {ipaddr}/{cidr}";
      };

      pulseaudio = {
        format = "{icon}  {volume}%";
        format-bluetooth = "󰂯  {volume}%";
        format-muted = "󰖁  muted";
        format-icons = {
          default = [
            "󰕿"
            "󰖀"
            "󰕾"
          ];
        };
        on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
      };

      backlight = {
        format = "󰃠  {percent}%";
      };

      battery = {
        format = "{icon}  {capacity}%";
        format-charging = "󰂄  {capacity}%";
        format-plugged = "󰚥  {capacity}%";
        format-icons = [
          "󰁺"
          "󰁻"
          "󰁼"
          "󰁽"
          "󰁾"
          "󰁿"
          "󰂀"
          "󰂁"
          "󰂂"
          "󰁹"
        ];
        states = {
          warning = 25;
          critical = 10;
        };
      };
    };

    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "JetBrainsMono Nerd Font";
        font-size: 11px;
        min-height: 0;
      }

      window#waybar {
        background: transparent;
        color: #cdd6f4;
      }

      tooltip {
        background: #1e1e2e;
        border: 2px solid #f5c2e7;
        border-radius: 8px;
        color: #cdd6f4;
      }

      #workspaces,
      #clock,
      #tray,
      #network,
      #pulseaudio,
      #backlight,
      #battery {
        background: #1e1e2e;
        border: 2px solid #313244;
        border-radius: 8px;
        margin: 0 4px;
        padding: 0 12px;
      }

      #workspaces {
        padding: 0 6px;
      }

      #workspaces button {
        color: #6c7086;
        padding: 0 7px;
      }

      #workspaces button.active {
        color: #f5c2e7;
      }

      #workspaces button.urgent {
        color: #f38ba8;
      }

      #clock {
        color: #f5c2e7;
        font-weight: 700;
      }

      #network {
        color: #89b4fa;
      }

      #pulseaudio {
        color: #94e2d5;
      }

      #backlight {
        color: #f9e2af;
      }

      #battery {
        color: #a6e3a1;
      }

      #battery.warning {
        color: #f9e2af;
      }

      #battery.critical {
        color: #f38ba8;
      }
    '';
  };
}
