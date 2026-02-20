{ pkgs, ... }:

{
   environment.systemPackages = with pkgs; [
     telegram-desktop
     firefox
     kitty
   ];
}
