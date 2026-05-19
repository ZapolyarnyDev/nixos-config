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
    grim
    slurp
    wl-clipboard
    playerctl
    libnotify

    # Theming
    dconf
  ];
}
