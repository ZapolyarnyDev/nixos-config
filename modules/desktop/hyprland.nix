{ pkgs, ... }:

{
  hardware.graphics.enable = true;

  environment.systemPackages = with pkgs; [
    playerctl
    libnotify
    hyprpaper
    waybar
    rofi
    mako
    grim
    slurp
    wl-clipboard
  ];

  programs.hyprland.enable = true;

  services.greetd.enable = true;
  services.greetd.settings.default_session = {
     command = "${pkgs.tuigreet}/bin/tuigreet --cmd ${pkgs.hyprland}/bin/Hyprland"
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-hyprland
  ];
} 
