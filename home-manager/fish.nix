

{ pkgs, ... } : {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';

    shellAliases = {
      rebh = "source ~/.nixconf/home-manager/scripts/home-rebuild.fish";
      rebn = "source ~/.nixconf/home-manager/scripts/nix-rebuild.fish";
    };
    
    plugins = [
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
      { name = "hydro"; src = pkgs.fishPlugins.hydro.src; }
    ];
  };
}
