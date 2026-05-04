{
  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };

    themeFile = "Catppuccin-Mocha";

    settings = {
      confirm_os_window_close = 0;
      cursor_shape = "beam";
      enable_audio_bell = false;
      hide_window_decorations = true;
      remember_window_size = false;
      scrollback_lines = 10000;
      update_check_interval = 0;
      window_padding_width = 8;
    };

    keybindings = {
      "ctrl+shift+c" = "copy_to_clipboard";
      "ctrl+shift+v" = "paste_from_clipboard";
      "ctrl+shift+equal" = "change_font_size all +1.0";
      "ctrl+shift+minus" = "change_font_size all -1.0";
      "ctrl+shift+backspace" = "change_font_size all 0";
    };
  };
}
