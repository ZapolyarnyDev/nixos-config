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
      icon-theme = "Papirus-Dark";
      drun-display-format = "{icon} {name}";
      display-drun = "Applications";
      display-run = "Run";
      display-window = "Windows";
      matching = "fuzzy";
      sort = true;
    };

    theme = {
      "*" = {
        base = mkLiteral "#1e1e2e";
        mantle = mkLiteral "#181825";
        surface0 = mkLiteral "#313244";
        surface1 = mkLiteral "#45475a";
        text = mkLiteral "#cdd6f4";
        subtext0 = mkLiteral "#a6adc8";
        overlay0 = mkLiteral "#6c7086";
        pink = mkLiteral "#f5c2e7";
        blue = mkLiteral "#89b4fa";
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
        border-radius = mkLiteral "10px";
        padding = mkLiteral "20px";
        width = mkLiteral "46%";
      };

      mainbox = {
        background-color = mkLiteral "transparent";
        children = map mkLiteral [
          "inputbar"
          "listview"
        ];
        spacing = mkLiteral "14px";
      };

      inputbar = {
        background-color = mkLiteral "@surface0";
        border = mkLiteral "1px";
        border-color = mkLiteral "@surface1";
        border-radius = mkLiteral "8px";
        children = map mkLiteral [
          "prompt"
          "entry"
        ];
        padding = mkLiteral "11px 14px";
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
        lines = 8;
        spacing = mkLiteral "7px";
      };

      element = {
        background-color = mkLiteral "transparent";
        border-radius = mkLiteral "8px";
        orientation = mkLiteral "horizontal";
        padding = mkLiteral "9px 12px";
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
    };
  };
}
