{pkgs, ... }:

{
   environment.systemPackages = with pkgs; [
      git
      neovim
      wget
      curl
      htop
      tree
   ];

   programs.git.enable = true;
}
