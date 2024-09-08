{ pkgs, ... }:
{
  services.emacs = {
    enable = true;
  };
  
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
    extraConfig = ''

    (tool-bar-mode -1) ; Bye tool bar
    (scroll-bar-mode -1) ; Bye scroll bar
    (menu-bar-mode -1) ; Bye menu bar

    (add-hook 'prog-mode-hook 'display-line-numbers-mode)
    (setq display-line-numbers-type 'relative)
    '';
  };
}
