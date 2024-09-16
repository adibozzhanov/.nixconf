

{ pkgs, ... } : {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';

    shellAliases = {
      rebh = "source ~/.nixconf/home-manager/scripts/home-rebuild.fish";
      rebn = "source ~/.nixconf/home-manager/scripts/nix-rebuild.fish";
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
}
