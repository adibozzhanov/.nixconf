{ inputs, ...}:
{
   nixpkgs.overlays = [ (import inputs.emacs-overlay) ];
   nur.repos.rycee.hmModules.emacs.init = {
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
