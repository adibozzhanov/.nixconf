{ inputs, nur, config, pkgs, ...}:
{  
   nur.repos.rycee.hmModules.emacs.init = {
     enable = true;
     packageQuickstart = false;
     recommendedGcSettings = true;
     usePackageVerbose = false;     
   };
}
