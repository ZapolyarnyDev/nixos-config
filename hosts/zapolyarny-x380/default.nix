{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/system/cli.nix
      ../../modules/desktop/apps.nix
      ../../modules/desktop/hyprland.nix
      ../../modules/desktop/theaming.nix  
  ];
}
