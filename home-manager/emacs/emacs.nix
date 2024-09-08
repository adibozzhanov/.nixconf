{ self, config, pkgs, ...}:
{
  imports = [
    self.inputs.nur.repos.rycee.hmModules.emacs-init
    self.inputs.nur.repos.rycee.hmModules.emacs-notmuch
  ];
  
  nixpkgs.overlays = [
    (import self.inputs.emacs-overlay)
  ];
  
  programs.emacs.init = {
    enable = true;
    packageQuickstart = false;
    recommendedGcSettings = true;
    usePackageVerbose = false;
  };

}
