{ self, pkgs, ...}:

let
  nurNoPkgs =
    import (import ../nix/sources.nix).nur { pkgs = throw "nixpkgs eval"; };
  pcfg = config.programs.emacs.init.usePackage;
in   
{
  imports = [
    nurNoPkgs.repos.rycee.hmModules.emacs-init
    nurNoPkgs.repos.rycee.hmModules.emacs-notmuch
  ];

  nixpkgs.overlays = [ (import self.inputs.emacs-overlay) ];

  programs.emacs.init = {
    enable = true;
    packageQuickstart = false;
    recommendedGcSettings = true;
    usePackageVerbose = false;
  };

  services.emacs = {
    enable = true;
    package = pkgs.emacs;
    defaultEditor = true;
  };
}
