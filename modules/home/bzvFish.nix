{ pkgs, lib, config, ... }:
with lib;
{
  options = {
    bzvFish.enable = mkEnableOption "Enable my fish config";
    bzvFish.withAliases = mkEnableOption "Use with nix aliases";
  };

  config = mkIf config.bzvFish.enable {
    home.packages = with pkgs; [
      grc
      neofetch
      git-filter-repo
      htop
      tree
    ];

    programs.fish = {
      enable = true;
      interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';

      shellAliases = mkIf config.bzvFish.withAliases {
        rebh = "source ~/.nixconf/scripts/home-rebuild.fish";
        rebn = "source ~/.nixconf/scripts/nix-rebuild.fish";
        nfup = "nix flake update ~/.nixconf";
        nfstat = "pushd ~/.nixconf; git status; popd";
        econf = "emacsclient ~/.nixconf";
        confpush = "pushd ~/.nixconf && git push && popd";
      };

      plugins = [
        { name = "grc"; src = pkgs.fishPlugins.grc.src; }
        { name = "hydro"; src = pkgs.fishPlugins.hydro.src; }
      ];
    };
  };
}
