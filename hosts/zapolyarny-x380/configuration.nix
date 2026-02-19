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

  
  ### sound ###

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  services.pulseaudio.enable = false;
  

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

  programs.dconf.enable = true;
  services.gvfs.enable = true;
  services.tumbler.enable = true;
  services.udisks2.enable = true;
  programs.git.enable = true;
  programs.zsh.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  security.sudo.wheelNeedsPassword = true;

  
  ## Hyprland ##
  
  programs.hyprland.enable = true;
  
  services.greetd.enable = true;
  services.greetd.settings.default_session = {
    command = "${pkgs.tuigreet}/bin/tuigreet --cmd ${pkgs.hyprland}/bin/Hyprland";
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-hyprland
  ];

  hardware.graphics.enable = true;


  ### environment ###

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  environment.systemPackages = with pkgs; [
    git
    neovim
    wget
    curl
    htop
    tree
    ripgrep
    fd
    bat
    eza
    tmux
    zsh
    starship
    neofetch
    pulseaudioFull
    kitty
    waybar
    rofi
    mako
    hyprpaper
    wl-clipboard
    grim
    slurp
    playerctl
    libnotify 
    firefox 

    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
    file-roller

    gtk3
    dconf
    glib
    gsettings-desktop-schemas

    arc-theme
    papirus-icon-theme
    papirus-folders
    lxappearance
];


  ### fonts ###
  
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];

  ### nix & system settings ###
  
  nix.settings.experimental-features = 
    ["nix-command" "flakes"];

  system.stateVersion = "25.11";

}

