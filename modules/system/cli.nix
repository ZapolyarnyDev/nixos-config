{pkgs, ... }:

{
   environment.systemPackages = with pkgs; [
      git
      neovim
      wget
      curl
      htop
      tree
      ripgrep
      fd
      bat
      eza
      tmux
      zsh
      starship
      neofetch	
   ];

   programs.zsh.enable = true;
   programs.git.enable = true;
}
