{
  programs.waybar = {
    enable = true;

    settings.mainBar = {
      layer = "top";
      position = "top";
      height = 40;
      margin = "8 12 0";

      modules-left = [
        "custom/launcher"
        "hyprland/workspaces"
        "hyprland/window"
      ];

      modules-center = [
        "clock"
      ];

      modules-right = [
        "cpu"
        "memory"
        "disk"
        "network"
        "pulseaudio"
        "backlight"
        "battery"
        "tray"
      ];

      "custom/launcher" = {
        format = "󱄅";
        tooltip = false;
        on-click = "rofi -show drun";
      };

      "hyprland/workspaces" = {
        disable-scroll = true;
        format = "{icon}";
        format-icons = {
          "1" = "一";
          "2" = "二";
          "3" = "三";
          "4" = "四";
          "5" = "五";
          urgent = "!";
          active = "●";
          default = "○";
        };
        persistent-workspaces = {
          "*" = 5;
        };
      };

      "hyprland/window" = {
        format = "{}";
        max-length = 54;
        separate-outputs = true;
      };

      clock = {
        format = "󰥔  {:%H:%M}";
        format-alt = "󰃭  {:%a, %d %b}";
        tooltip-format = "<big>{:%A, %d %B %Y}</big>\n<tt>{calendar}</tt>";
        calendar = {
          mode = "month";
          weeks-pos = "right";
        };
      };

      cpu = {
        format = "󰍛  {usage}%";
        tooltip = true;
      };

      memory = {
        format = "󰘚  {percentage}%";
        tooltip-format = "{used:0.1f}G / {total:0.1f}G";
      };

      disk = {
        format = "󰋊  {percentage_used}%";
        path = "/";
        tooltip-format = "{used} used / {total} total";
      };

      network = {
        format-wifi = "󰤨  {signalStrength}%";
        format-ethernet = "󰈀  wired";
        format-disconnected = "󰤭  offline";
        tooltip-format = "{ifname}: {ipaddr}/{cidr}";
        tooltip-format-wifi = "{essid}\n{ifname}: {ipaddr}/{cidr}\n{bandwidthUpBytes} up / {bandwidthDownBytes} down";
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
        on-scroll-up = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
        on-scroll-down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
      };

      backlight = {
        format = "󰃠  {percent}%";
        on-scroll-up = "brightnessctl set 5%+ -q";
        on-scroll-down = "brightnessctl set 5%- -q";
      };

      battery = {
        format = "{icon}  {capacity}%";
        format-charging = "󰂄  {capacity}%";
        format-full = "󰁹  full";
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
          warning = 30;
          critical = 15;
        };
      };

      tray = {
        icon-size = 18;
        spacing = 10;
      };
    };

    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "JetBrainsMono Nerd Font";
        font-size: 12px;
        font-weight: 600;
        min-height: 0;
      }

      window#waybar {
        background: transparent;
        color: #cdd6f4;
      }

      tooltip {
        background: rgba(30, 30, 46, 0.96);
        border: 2px solid #45475a;
        border-radius: 10px;
        color: #cdd6f4;
        padding: 10px;
      }

      #custom-launcher,
      #workspaces,
      #window,
      #clock,
      #cpu,
      #memory,
      #disk,
      #network,
      #pulseaudio,
      #backlight,
      #battery,
      #tray {
        background: rgba(30, 30, 46, 0.92);
        border: 1px solid rgba(245, 194, 231, 0.16);
        border-bottom: 2px solid #313244;
        border-radius: 11px;
        margin: 0 3px;
        padding: 0 12px;
      }

      #custom-launcher {
        background: linear-gradient(135deg, #f5c2e7, #89b4fa);
        border-bottom-color: #f5c2e7;
        color: #11111b;
        font-size: 17px;
        padding: 0 15px;
      }

      #workspaces {
        padding: 0 6px;
      }

      #workspaces button {
        background: transparent;
        border-radius: 9px;
        color: #6c7086;
        margin: 5px 2px;
        padding: 0 8px;
      }

      #workspaces button:hover {
        background: #313244;
        color: #cdd6f4;
      }

      #workspaces button.active {
        background: #313244;
        color: #f5c2e7;
      }

      #workspaces button.urgent {
        background: #f38ba8;
        color: #11111b;
      }

      #window {
        color: #a6adc8;
        font-weight: 500;
        min-width: 120px;
      }

      window#waybar.empty #window {
        background: transparent;
        border-color: transparent;
        border-bottom-color: transparent;
      }

      #clock {
        background: rgba(24, 24, 37, 0.94);
        border-bottom-color: #f5c2e7;
        color: #f5c2e7;
        font-size: 13px;
        padding: 0 16px;
      }

      #cpu {
        border-bottom-color: #cba6f7;
        color: #cba6f7;
      }

      #memory {
        border-bottom-color: #89b4fa;
        color: #89b4fa;
      }

      #disk {
        border-bottom-color: #94e2d5;
        color: #94e2d5;
      }

      #network {
        border-bottom-color: #74c7ec;
        color: #74c7ec;
      }

      #network.disconnected {
        border-bottom-color: #f38ba8;
        color: #f38ba8;
      }

      #pulseaudio {
        border-bottom-color: #a6e3a1;
        color: #a6e3a1;
      }

      #pulseaudio.muted {
        border-bottom-color: #6c7086;
        color: #6c7086;
      }

      #backlight {
        border-bottom-color: #f9e2af;
        color: #f9e2af;
      }

      #battery {
        border-bottom-color: #a6e3a1;
        color: #a6e3a1;
      }

      #battery.warning {
        border-bottom-color: #fab387;
        color: #fab387;
      }

      #battery.critical {
        border-bottom-color: #f38ba8;
        color: #f38ba8;
      }

      #tray {
        border-bottom-color: #45475a;
        padding: 0 12px;
      }
    '';
  };
}
