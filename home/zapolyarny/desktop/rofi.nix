{ config, pkgs, ... }:

let
  inherit (config.lib.formats.rasi) mkLiteral;
in
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

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
        background = mkLiteral "#1e1e2e";
        background-alt = mkLiteral "#313244";
        border = mkLiteral "#f5c2e7";
        foreground = mkLiteral "#cdd6f4";
        muted = mkLiteral "#6c7086";
        selected = mkLiteral "#f5c2e7";
        urgent = mkLiteral "#f38ba8";
      };

      window = {
        background-color = mkLiteral "@background";
        border = mkLiteral "2px";
        border-color = mkLiteral "@border";
        border-radius = mkLiteral "8px";
        padding = mkLiteral "18px";
        width = mkLiteral "42%";
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
        background-color = mkLiteral "@background-alt";
        border-radius = mkLiteral "6px";
        children = map mkLiteral [
          "prompt"
          "entry"
        ];
        padding = mkLiteral "10px 12px";
        spacing = mkLiteral "10px";
      };

      prompt = {
        text-color = mkLiteral "@selected";
      };

      entry = {
        placeholder = "Search";
        placeholder-color = mkLiteral "@muted";
        text-color = mkLiteral "@foreground";
      };

      listview = {
        background-color = mkLiteral "transparent";
        columns = 1;
        fixed-height = false;
        lines = 8;
        spacing = mkLiteral "6px";
      };

      element = {
        background-color = mkLiteral "transparent";
        border-radius = mkLiteral "6px";
        orientation = mkLiteral "horizontal";
        padding = mkLiteral "8px 10px";
        spacing = mkLiteral "10px";
      };

      element-icon = {
        size = mkLiteral "24px";
      };

      element-text = {
        text-color = mkLiteral "@foreground";
        vertical-align = mkLiteral "0.5";
      };

      "element selected" = {
        background-color = mkLiteral "@background-alt";
      };

      "element selected element-text" = {
        text-color = mkLiteral "@selected";
      };

      "element urgent element-text" = {
        text-color = mkLiteral "@urgent";
      };
    };
  };
}
