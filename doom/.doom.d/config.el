;;;  -*- lexical-binding: t; -*-

;;; Code:
(require 'company)

(setq menu-bar-mode nil
      confirm-kill-emacs nil
      home-directory (getenv "HOME")
      doom-theme 'doom-solarized-dark-high-contrast
      doom-unicode-font nil
      doom-one-brighter-comments t
      doom-font (font-spec :family "DejaVu Sans Mono" :size 13)
      doom-big-font (font-spec :family "DejaVu Sans Mono" :size 14)
      company-idle-delay 0.2
      company-minimum-prefix-length 3
      truncate-lines t
      evil-snipe-scope 'buffer
      evil-snipe-spillover-scope 'while-buffer
      org-table-number-regexp "nil"
      whitespace-style '(face trailing)
)

(add-to-list 'exec-path (concat home-directory "/.pyenv/shims"))
(add-to-list 'exec-path (concat home-directory "/.cargo/bin"))
(add-to-list 'exec-path (concat home-directory "/.nodenv/shims"))

;; open bigger Window in GUI mode
(if (window-system)
  (set-frame-size (selected-frame) 140 55))

(use-package! osx-clipboard
  :diminish osx-clipboard-mode
  :config
  (osx-clipboard-mode t))

(add-to-list 'auto-mode-alist '("\\.dig\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.gradle\\'" . groovy-mode))
(add-to-list 'auto-mode-alist '("\\.tf\\'" . terraform-mode))
(add-to-list 'auto-mode-alist '("\\.tfvars\\'" . terraform-mode))

(add-hook 'prog-mode-hook 'whitespace-mode)

(add-hook 'terraform-mode-hook #'terraform-format-on-save-mode)

(map!
  :gnvime "M-[ k"  #'evil-window-up
  :gnvime "M-[ j"  #'evil-window-down
  :gnvime "M-[ h"  #'evil-window-left
  :gnvime "M-[ l"  #'evil-window-right
  :ne "M-RET"    #'toggle-frame-fullscreen

  (:leader
    (:desc "file" :prefix "f"
           :desc "Browse files"            :n "f"   #'find-file)

    (:desc "project" :prefix "p"
           :desc "Find file in project" :n "f" #'counsel-fzf
           :desc "Invalidate cache" :n "i" #'projectile-invalidate-cache)

    ;(:desc "search" :prefix "/"
    ;       :desc "Ripgrep"                :nv "/" #'counsel-rg)

    (:desc "open" :prefix "o"
           :desc "Password manager" :n "p" #'+pass/ivy
           :desc "Terminal in project"   :n  "t" #'+term/open-popup-in-project)
  )
)

(provide 'config)
;;; config.el ends here
