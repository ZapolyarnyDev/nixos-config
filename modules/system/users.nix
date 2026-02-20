{ pkgs, ... }:

{
  users.users.zapolyarny = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };
}
