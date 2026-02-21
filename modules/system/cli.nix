{pkgs, ... }:

{
   programs.zsh.enable = true;
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
