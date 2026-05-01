{
  programs.ripgrep = {
    enable = true;

    arguments = [
      "--smart-case"
      "--max-columns=150"
      "--max-columns-preview"
      "--glob=!.git/*"
      "--glob=!node_modules/*"
      "--glob=!result"
      "--glob=!result-*"
    ];
  };
}
