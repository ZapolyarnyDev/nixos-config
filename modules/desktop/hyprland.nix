{ pkgs, ... }:

{
  hardware.graphics.enable = true;

  programs.dconf.enable = true;
  programs.hyprland.enable = true;

  services.greetd.enable = true;
  services.greetd.settings.default_session = {
     command = "${pkgs.tuigreet}/bin/tuigreet --cmd ${pkgs.hyprland}/bin/Hyprland";
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-hyprland
  ];
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];
} 
