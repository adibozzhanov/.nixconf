{ pkgs, lib, config, ... }:
with lib;
{
  options = {
    bzvKitty.enable = mkEnableOption "Enable default kitty config";
  };

  config = mkIf config.bzvKitty.enable {
    programs.kitty = {
      enable = true;
      themeFile = "Ollie";
    };
  };
}
