{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  ### users ###

  users.users.zapolyarny = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };


  ### programs, hardware ###

  services.gvfs.enable = true;
  services.tumbler.enable = true;
  services.udisks2.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  security.sudo.wheelNeedsPassword = true;

  ### nix & system settings ###
  
  nix.settings.experimental-features = 
    ["nix-command" "flakes"];

  system.stateVersion = "25.11";

}

