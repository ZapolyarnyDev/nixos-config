{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
    file-roller
  ];
}
