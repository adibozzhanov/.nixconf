{ self, inputs, config, pkgs, ...}:
{
  imports = [
    inputs.nur.repos.rycee.hmModules.emacs-init
    inputs.nur.repos.rycee.hmModules.emacs-notmuch
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
