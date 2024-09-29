{ pkgs, lib, config, ... }:
with lib;
{
  options = {
    bzvGit.enable = mkEnableOption "Enable default git config";
  };

  config = mkIf config.bzvFish.enable {
    programs.git = {
      enable = true;
      userName  = "Adi Bozzhanov";
      userEmail = "bozzhanov.at@gmail.com";
      lfs.enable = true;
    };
  };
}
