{
  programs.emacs.extraConfig = ''
    (tool-bar-mode -1)
    (scroll-bar-mode -1)
    (menu-bar-mode -1)
    (add-hook 'prog-mode-hook 'display-line-numbers-mode)
    (setq display-line-numbers-type 'relative)
    (show-paren-mode)
    (set-default 'truncate-lines t)
    
    (use-package monokai-pro-theme
      :ensure t
      :config
      (load-theme 'monokai-pro-machine t))

  '';
}