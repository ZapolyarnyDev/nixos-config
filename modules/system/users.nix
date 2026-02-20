{ pkgs, ... }:

{
  users.user.zapolyarny = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };
}
