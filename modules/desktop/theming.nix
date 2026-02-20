{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    lxappearance

    xsettingsd
    nwg-look
  ];
}
