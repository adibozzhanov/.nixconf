{ inputs, nurNoPkgs, config, pkgs, ...}:
{
  imports = [
    nurNoPkgs.repos.rycee.hmModules.emacs-init
    nurNoPkgs.myNur.repos.rycee.hmModules.emacs-notmuch
  ];
  
  nixpkgs.overlays = [
    (import inputs.emacs-overlay)
  ];
  
  programs.emacs.init = {
    enable = true;
    packageQuickstart = false;
    recommendedGcSettings = true;
    usePackageVerbose = false;
  };
}
