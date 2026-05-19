{
  services.mako = {
    enable = true;

    settings = {
      anchor = "top-right";
      background-color = "#1e1e2e";
      border-color = "#f5c2e7";
      border-radius = 8;
      border-size = 2;
      default-timeout = 5000;
      font = "JetBrainsMono Nerd Font 11";
      format = "<b>%s</b>\\n%b";
      group-by = "app-name";
      height = 160;
      icons = true;
      layer = "overlay";
      margin = "12,12,0";
      max-icon-size = 48;
      max-visible = 5;
      padding = "12,14";
      progress-color = "over #313244";
      sort = "-time";
      text-color = "#cdd6f4";
      width = 360;

      "urgency=high" = {
        border-color = "#f38ba8";
        default-timeout = 0;
      };

      "urgency=low" = {
        border-color = "#6c7086";
        default-timeout = 3000;
      };
    };
  };
}
