{ pkgs, ... }:

let
  wallpaper = pkgs.runCommand "catppuccin-mocha-wallpaper.png" { nativeBuildInputs = [ pkgs.imagemagick ]; } ''
    magick -size 3840x2160 gradient:"#1e1e2e-#181825" \
      -fill "#f5c2e7" -draw "circle 3060,520 3060,180" \
      -fill "#89b4fa" -draw "circle 3260,760 3260,500" \
      -fill "#94e2d5" -draw "circle 2860,860 2860,660" \
      -blur 0x120 \
      -fill "#11111b99" -draw "rectangle 0,1720 3840,2160" \
      -fill "#cdd6f4" -pointsize 56 -gravity southwest -annotate +160+190 "zapolyarny" \
      -fill "#6c7086" -pointsize 32 -gravity southwest -annotate +164+145 "NixOS / Hyprland" \
      "$out"
  '';
in
{
  services.hyprpaper = {
    enable = true;

    settings = {
      ipc = "off";
      preload = [ "${wallpaper}" ];
      splash = false;
      wallpaper = [ ",${wallpaper}" ];
    };
  };
}
