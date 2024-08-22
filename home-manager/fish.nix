

{ pkgs, ... } : {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';

    shellAliases = {
      hms = "home-manager switch --flake ~/.nixconf";
      nrs = "source ~/.nixconf/home-manager/scripts/nix-rebuild.fish";
      reb = "source ~/nix/home-manager/scripts/rebuild.sh";
    };
    
    plugins = [
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
      { name = "hydro"; src = pkgs.fishPlugins.hydro.src; }
    ];
  };
}
