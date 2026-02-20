{ config, lib, pkgs ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/system/cli.nix
    ];
}
