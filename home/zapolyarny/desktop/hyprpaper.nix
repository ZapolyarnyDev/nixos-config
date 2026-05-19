let
  wallpaper = ./wallpapers/current.jpg;
in
{
  services.hyprpaper = {
    enable = true;

    settings = {
      ipc = "off";
      preload = [ "${wallpaper}" ];
      splash = false;
      wallpaper = [ ",${wallpaper}" ];
    };
  };
}
