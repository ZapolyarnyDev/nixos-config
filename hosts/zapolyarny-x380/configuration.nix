{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  ### programs, hardware ###

  services.gvfs.enable = true;
  services.tumbler.enable = true;
  services.udisks2.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  ### nix & system settings ###
  
  nix.settings.experimental-features = 
    ["nix-command" "flakes"];

  system.stateVersion = "25.11";

}

