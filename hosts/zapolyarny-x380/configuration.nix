{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

     
  ### networking ###

  networking.hostName = "zapolyarny-x380";

  networking.networkmanager.enable = true;

  
  ### i18n & time zone ###

  time.timeZone = "Europe/Moscow";

  i18n.defaultLocale = "en_US.UTF-8";

  console.keyMap = "us";

  

  ### bluetooth ###

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;


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

  ### environment ###

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  environment.systemPackages = with pkgs; [
    playerctl
    libnotify

    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
    file-roller
  ];

  ### nix & system settings ###
  
  nix.settings.experimental-features = 
    ["nix-command" "flakes"];

  system.stateVersion = "25.11";

}

