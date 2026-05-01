_:

{
  nix = {
    channel.enable = false;

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };

    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];

      trusted-users = [
        "root"
        "@wheel"
      ];

      min-free = 5 * 1024 * 1024 * 1024;
      max-free = 20 * 1024 * 1024 * 1024;

      max-jobs = "auto";
      sandbox = true;
      keep-going = true;
      log-lines = 30;

      warn-dirty = false;
      accept-flake-config = false;

      keep-derivations = true;
      keep-outputs = true;
    };
  };

  system.stateVersion = "25.11";
}
