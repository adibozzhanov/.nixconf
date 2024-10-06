{ lib, config, ...}:
with lib;
let
  logoPath = ./logo.png;
  src = builtins.fetchurl {
    url = "https://gdlauncher.com/download/linux";
    sha256 = "0ah23b7rmap935r83bbap0sjrnfmlmjw71k34bdw3p4fr99m33xl";
  };
in
{
  options = {
    bzvMinecraft.enable = mkEnableOption "Enable minecraft thingy";
  };

  config = mkIf config.bzvMinecraft.enable {
    xdg.desktopEntries = {
      GDLauncher = {
        name = "GDLauncher";
        genericName = "Minecraft";
        exec = "appimage-run ${src}";
        terminal = false;
        icon = logoPath;
      };
    };
  };
}
