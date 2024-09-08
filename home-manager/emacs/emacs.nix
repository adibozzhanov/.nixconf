{ inputs, nur, pkgs, ...}:

let
  nurNoPkgs = import nur { pkgs = null; nurpkgs = pkgs; };
in  
{
   imports = [
     nurNoPkgs.repos.rycee.hmModules.emacs-init
   ];
   
   
   programs.emacs.init = {
     enable = true;
     packageQuickstart = false;
     recommendedGcSettings = true;
     usePackageVerbose = false;
     earlyInit = ''

     ;; Remove useless UI shit
     (tool-bar-mode -1) ; Bye tool bar
     (scroll-bar-mode -1) ; Bye scroll bar
     (menu-bar-mode -1) ; Bye menu bar

     (require monokai-pro-theme)
     (load-theme 'monokai-pro-theme t)
     '';
   };
}
