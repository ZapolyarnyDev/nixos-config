{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # CLI
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
    dconf
  ];
}
