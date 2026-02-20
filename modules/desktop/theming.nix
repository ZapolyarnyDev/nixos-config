{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gtk3
    dconf
    glib

    arc-theme
    papirus-icon-theme
    papirus-folders
    lxappearance

    (catppuccin-gtk.override {
        accents = [ "pink" ];
	size = "standard";
        tweaks = [ "rimless" ];
	variant = "mocha";
    })

    xsettingsd
    nwg-look
  ];

  programs.dconf.enable = true;
  
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];
}
