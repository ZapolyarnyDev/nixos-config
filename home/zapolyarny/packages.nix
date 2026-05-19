{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # CLI
    tmux
    neofetch

    # Apps
    firefox
    telegram-desktop
    vscodium

    # Wayland Tools
    waybar
    hyprpaper
    grim
    slurp
    wl-clipboard
    playerctl
    libnotify

    # Theming
    dconf
  ];
}
