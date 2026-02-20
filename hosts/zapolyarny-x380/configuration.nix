{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];
     
  ### networking ###

  networking.hostName = "zapolyarny-x380";

  networking.networkmanager.enable = true;

  
  ### i18n & time zone ###

  time.timeZone = "Europe/Moscow";

  i18n.defaultLocale = "en_US.UTF-8";

  console.keyMap = "us";


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

