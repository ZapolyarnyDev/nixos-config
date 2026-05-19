{ config, pkgs, ... }:

let
  inherit (config.lib.formats.rasi) mkLiteral;
in
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;

    font = "JetBrainsMono Nerd Font 11";
    terminal = "${pkgs.kitty}/bin/kitty";

    extraConfig = {
      modi = "drun,run,window";
      show-icons = true;
      icon-theme = "Papirus";
      drun-categories = "Utility;Development;Network;Office;Graphics;AudioVideo;Game;";
      drun-display-format = "{icon} {name}";
      drun-match-fields = "name,generic,exec,categories,keywords";
      display-drun = "Applications";
      display-run = "Run";
      display-window = "Windows";
      hide-scrollbar = true;
      matching = "fuzzy";
      sort = true;
    };

    theme = {
      "*" = {
        base = mkLiteral "#1e1e2e";
        mantle = mkLiteral "#181825";
        crust = mkLiteral "#11111b";
        surface0 = mkLiteral "#313244";
        surface1 = mkLiteral "#45475a";
        surface2 = mkLiteral "#585b70";
        text = mkLiteral "#cdd6f4";
        subtext0 = mkLiteral "#a6adc8";
        overlay0 = mkLiteral "#6c7086";
        pink = mkLiteral "#f5c2e7";
        blue = mkLiteral "#89b4fa";
        lavender = mkLiteral "#b4befe";
        teal = mkLiteral "#94e2d5";
        urgent = mkLiteral "#f38ba8";

        background-color = mkLiteral "transparent";
        border-color = mkLiteral "transparent";
        margin = 0;
        padding = 0;
        spacing = 0;
        text-color = mkLiteral "@text";
      };

      window = {
        background-color = mkLiteral "@base";
        border = mkLiteral "2px";
        border-color = mkLiteral "@pink";
        border-radius = mkLiteral "14px";
        padding = mkLiteral "18px";
        width = mkLiteral "44%";
      };

      mainbox = {
        background-color = mkLiteral "transparent";
        children = map mkLiteral [
          "inputbar"
          "listview"
          "mode-switcher"
        ];
        spacing = mkLiteral "12px";
      };

      inputbar = {
        background-color = mkLiteral "@surface0";
        border = mkLiteral "1px";
        border-color = mkLiteral "@surface1";
        border-radius = mkLiteral "10px";
        children = map mkLiteral [
          "prompt"
          "entry"
        ];
        padding = mkLiteral "10px 13px";
        spacing = mkLiteral "12px";
      };

      prompt = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@pink";
      };

      entry = {
        background-color = mkLiteral "transparent";
        cursor-color = mkLiteral "@pink";
        placeholder = "Search";
        placeholder-color = mkLiteral "@overlay0";
        text-color = mkLiteral "@text";
      };

      listview = {
        background-color = mkLiteral "transparent";
        columns = 1;
        fixed-height = false;
        lines = 7;
        spacing = mkLiteral "6px";
      };

      element = {
        background-color = mkLiteral "transparent";
        border = mkLiteral "1px";
        border-color = mkLiteral "transparent";
        border-radius = mkLiteral "10px";
        orientation = mkLiteral "horizontal";
        padding = mkLiteral "9px 11px";
        spacing = mkLiteral "12px";
      };

      element-icon = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
        size = mkLiteral "24px";
      };

      element-text = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
        vertical-align = mkLiteral "0.5";
      };

      "element normal normal" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@text";
      };

      "element alternate normal" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@text";
      };

      "element selected normal" = {
        background-color = mkLiteral "@surface0";
        border-color = mkLiteral "@surface1";
        text-color = mkLiteral "@pink";
      };

      "element urgent normal" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@urgent";
      };

      "element selected urgent" = {
        background-color = mkLiteral "@surface0";
        text-color = mkLiteral "@urgent";
      };

      mode-switcher = {
        background-color = mkLiteral "transparent";
        spacing = mkLiteral "8px";
      };

      button = {
        background-color = mkLiteral "@mantle";
        border = mkLiteral "1px";
        border-color = mkLiteral "@surface0";
        border-radius = mkLiteral "9px";
        padding = mkLiteral "8px 10px";
        text-color = mkLiteral "@subtext0";
      };

      "button selected" = {
        background-color = mkLiteral "@surface0";
        border-color = mkLiteral "@pink";
        text-color = mkLiteral "@pink";
      };
    };
  };
}
