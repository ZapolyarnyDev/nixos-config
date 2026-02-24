{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    sing-box
  ];

  boot.kernelModules = [ "tun" ];

  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = 1;
    "net.ipv6.all.forwarding" = 1;
  };
}
