{ pkgs, ...}:
{

  services.emacs = {
    enable = true;
    package = pkgs.emacs;
    defaultEditor = true;
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
    
    extraConfig = ''
    (setq package-archives nil)
    (defalias 'yes-or-no-p 'y-or-n-p)
    (tool-bar-mode -1)
    (scroll-bar-mode -1)
    (menu-bar-mode -1)
    (add-hook 'prog-mode-hook 'display-line-numbers-mode)
    (setq display-line-numbers-type 'relative)
    (show-paren-mode)
    (set-default 'truncate-lines t)
    ''; 
  };
}
