{ pkgs, ... }:

let
  brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
  grim = "${pkgs.grim}/bin/grim";
  kitty = "${pkgs.kitty}/bin/kitty";
  playerctl = "${pkgs.playerctl}/bin/playerctl";
  rofi = "${pkgs.rofi}/bin/rofi";
  slurp = "${pkgs.slurp}/bin/slurp";
  wl-copy = "${pkgs.wl-clipboard}/bin/wl-copy";
  wpctl = "${pkgs.wireplumber}/bin/wpctl";
in
{
  wayland.windowManager.hyprland = {
    enable = true;

    package = null;
    portalPackage = null;

    systemd = {
      enable = true;
      variables = [ "--all" ];
    };

    settings = {
      "$mod" = "SUPER";

      exec-once = [
        "systemctl --user import-environment WAYLAND_DISPLAY HYPRLAND_INSTANCE_SIGNATURE XDG_CURRENT_DESKTOP XDG_SESSION_TYPE"
        "systemctl --user restart hyprpaper.service"
        "systemctl --user restart mako.service"
        "waybar"
      ];

      general = {
        gaps_in = 7;
        gaps_out = 11;
        border_size = 2;
        "col.active_border" = "rgb(f5c2e7) rgb(89b4fa) 45deg";
        "col.inactive_border" = "rgb(45475a)";
      };

      decoration = {
        rounding = 11;
        active_opacity = 1.0;
        inactive_opacity = 0.96;
        fullscreen_opacity = 1.0;

        shadow = {
          enabled = true;
          color = "rgba(11111bdd)";
          color_inactive = "rgba(11111b00)";
          range = 20;
          render_power = 4;
        };

        blur = {
          enabled = true;
          ignore_opacity = true;
          new_optimizations = true;
          passes = 2;
          size = 5;
          vibrancy = 0.12;
        };
      };

      animations = {
        enabled = true;

        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
        ];

        animation = [
          "windows,1,4,easeOutQuint"
          "windowsOut,1,3,easeInOutCubic,popin 80%"
          "border,1,6,easeOutQuint"
          "fade,1,4,easeOutQuint"
          "workspaces,1,4,easeOutQuint,slide"
        ];
      };

      input = {
        kb_layout = "us,ru";
        kb_options = "grp:alt_shift_toggle";
        follow_mouse = 1;
        sensitivity = 0;

        touchpad = {
          natural_scroll = false;
          tap-to-click = true;
        };
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        force_default_wallpaper = 0;
      };

      bind = [
        "$mod, code:36, exec, ${kitty}"
        "$mod, code:40, exec, ${rofi} -show drun"
        "$mod, code:27, exec, ${rofi} -show run"
        "$mod, code:24, killactive,"
        "$mod, code:41, fullscreen,"
        "$mod, code:65, togglefloating,"
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "$mod SHIFT, code:39, exec, ${grim} -g \"$(${slurp})\" - | ${wl-copy}"
        ", Print, exec, ${grim} -g \"$(${slurp})\" - | ${wl-copy}"
        ", XF86AudioMute, exec, ${wpctl} set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, ${wpctl} set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ", XF86AudioPlay, exec, ${playerctl} play-pause"
        ", XF86AudioPause, exec, ${playerctl} play-pause"
        ", XF86AudioNext, exec, ${playerctl} next"
        ", XF86AudioPrev, exec, ${playerctl} previous"
      ]
      ++ builtins.concatLists (
        builtins.genList (
          x:
          let
            ws = toString (x + 1);
          in
          [
            "$mod, ${ws}, workspace, ${ws}"
            "$mod SHIFT, ${ws}, movetoworkspace, ${ws}"
          ]
        ) 9
      );

      binde = [
        ", XF86AudioRaiseVolume, exec, ${wpctl} set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, ${wpctl} set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86MonBrightnessUp, exec, ${brightnessctl} set 5%+ -q"
        ", XF86MonBrightnessDown, exec, ${brightnessctl} set 5%- -q"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };
}
