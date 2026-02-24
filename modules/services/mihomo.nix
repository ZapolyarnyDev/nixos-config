{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mihomo
  ];

  services.mihomo = {
    enable = true;
    tunMode = true;
    configFile = "/home/zapolyarny/.config/mihomo/config.yaml";
  };

  boot.kernelModules = [ "tun" ];

  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = 1;
    "net.ipv6.all.forwarding" = 1;
  };
}
