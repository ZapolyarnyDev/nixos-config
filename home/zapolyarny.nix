{ pkgs, ... }:

{
  home = {
    username = "zapolyarny";
    homeDirectory = "/home/zapolyarny";
    stateVersion = "25.11";
  };

  programs = {
    starship.enable = true;
    home-manager.enable = true;
  };

  home.packages = with pkgs; [
    # CLI
    ripgrep
    fd
    bat
    eza
    tmux
    neofetch

    # Apps
    firefox
    telegram-desktop
    kitty
    vscodium

    # Wayland Tools
    waybar
    rofi
    mako
    hyprpaper
    grim
    slurp
    wl-clipboard
    playerctl
    libnotify

    # Theming
    gtk3
    dconf
    glib
    arc-theme
    papirus-icon-theme
    papirus-folders

    (catppuccin-gtk.override {
      accents = [ "pink" ];
      size = "standard";
      tweaks = [ "rimless" ];
      variant = "mocha";
    })

  ];
}
