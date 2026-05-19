{
  services.mako = {
    enable = true;

    settings = {
      anchor = "top-right";
      background-color = "#1e1e2ee6";
      border-color = "#b4befe";
      border-radius = 10;
      border-size = 2;
      default-timeout = 5000;
      font = "JetBrainsMono Nerd Font 10";
      format = "<b>%s</b>\\n%b";
      group-by = "app-name";
      height = 160;
      icons = true;
      layer = "overlay";
      margin = "10,12,0";
      max-icon-size = 48;
      max-visible = 5;
      padding = "11,13";
      progress-color = "over #45475a";
      sort = "-time";
      text-color = "#cdd6f4";
      width = 360;

      "urgency=high" = {
        border-color = "#f38ba8";
        progress-color = "over #f38ba8";
        default-timeout = 0;
      };

      "urgency=low" = {
        border-color = "#6c7086";
        default-timeout = 3000;
      };
    };
  };
}
