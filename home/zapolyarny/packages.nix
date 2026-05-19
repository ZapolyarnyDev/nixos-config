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
    grim
    slurp
    wl-clipboard
    playerctl
    libnotify

    # Theming
    dconf
  ];
}
