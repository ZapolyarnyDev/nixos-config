{ config, pkgs, ... }:

{
  boot.kernelModules = [ "tun" ];

  networking.firewall.enable = true;

  environment.systemPackages = with pkgs; [
    clash-verge-rev
  ];
}
