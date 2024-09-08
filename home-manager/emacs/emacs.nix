{ self, inputs, config, pkgs, ...}:

let
  myNur = import (inputs.nur);
in
{
  imports = [
    myNur.repos.rycee.hmModules.emacs-init
    myNur.repos.rycee.hmModules.emacs-notmuch
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
