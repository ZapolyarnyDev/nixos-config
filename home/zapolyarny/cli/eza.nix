{
  programs.eza = {
    enable = true;
    icons = "auto";
    git = true;

    extraOptions = [
      "--group-directories-first"
      "--header"
      "--time-style=long-iso"
    ];
  };
}
