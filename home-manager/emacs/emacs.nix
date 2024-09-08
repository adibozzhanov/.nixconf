{ self, config, pkgs, ...}:
{

  nixpkgs.overlays = [
    (import self.inputs.emacs-overlay)
    (import self.inputs.nur)
  ];
  


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
