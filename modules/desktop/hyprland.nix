{ pkgs, ... }:

{
  hardware.graphics.enable = true;

  programs.dconf.enable = true;
  programs.hyprland.enable = true;

  services.greetd = {
    enable = true;

    settings = {
	default_session = {
		command = "${pkgs.greetd.tuigreet}/bin/tuigreet \
			--time \
			--remember \
			--remember-user-session \
			--asterisks \
			--theme border=magenta;text=white;prompt=magenta;time=cyan;action=magenta \
			--cmd Hyprland";
			user = "greeter";
		
      };
    };
  };

  console.colors = [
	"1e1e2e"
	"f38ba8"
	"a6adc8"
	"f5c2e7"
	"cdd6f4"
	"89b4fa"
	"94e2d5"
	"bac2de"
	"585b70"
	"f38ba8"
	"a6adc8"
	"f5c2e7"
	"cdd6f4"
	"89b4fa"
	"94e2d5"
	"ffffff"
  ];

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-hyprland
  ];
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];
} 
