_:

{
  imports = [
    ./cli
    ./desktop
    ./packages.nix
    ./programs.nix
  ];

  home = {
    username = "zapolyarny";
    homeDirectory = "/home/zapolyarny";
    stateVersion = "25.11";
  };
}
