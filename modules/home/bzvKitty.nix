{ pkgs, lib, config, ... }:
with lib;
{
  options = {
    bzvKitty.enable = mkEnableOption "Enable default kitty config";
    bzvKitty.isUbuntu = mkEnableOption "Enable ubuntu mode";
  };

  config = mkIf config.bzvKitty.enable {
    programs.kitty = {
      package = mkIf config.bzvKitty.isUbuntu (config.lib.nixGL.wrap pkgs.kitty);
      enable = true;
      themeFile = "Ollie";
    };
  };
}
