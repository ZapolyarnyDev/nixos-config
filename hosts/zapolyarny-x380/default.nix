{ ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/system/cli.nix
      ../../modules/desktop/hyprland.nix
      ../../modules/desktop/theming.nix
      ../../modules/services/audio.nix  
      ../../modules/services/bluetooth.nix
      ../../modules/desktop/filemanager.nix
      ../../modules/system/environment.nix
      ../../modules/system/boot.nix
      ../../modules/system/networking.nix
      ../../modules/system/regional.nix
      ../../modules/system/users.nix
      ../../modules/system/security.nix
      ../../modules/services/desktop-integration.nix
      ../../modules/system/crypto.nix
      ../../modules/system/nix.nix
    ];
}
