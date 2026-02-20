{ config, pkgs, ... }:

{
	home.username = "zapolyarny";
	home.homeDirectory = "/home/zapolyarny";
	home.stateVersion = "25.11";
       
	programs.home-manager.enable = true;
}
