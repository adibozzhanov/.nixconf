{ inputs, config, pkgs, ...}:

let
  nurr = import inputs.nur {pkgs = null; nurpkgs = pkgs};
in
{
  imports = [
    nurr.repos.ryceehmdModules.emacs-init
  ];
  
  programs.emacs.init = {
    enable = true;
    packageQuickstart = false;
    recommendedGcSettings = true;
    usePackageVerbose = false;
  };
}
