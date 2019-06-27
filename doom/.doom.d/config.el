;;;  -*- lexical-binding: t; -*-

;;; Code:
(require 'company)

(setq confirm-kill-emacs nil
      home-directory (getenv "HOME")
      doom-theme 'doom-one
      doom-font (font-spec :family "DejaVu Sans Mono" :size 13)
      doom-big-font (font-spec :family "DejaVu Sans Mono" :size 14)
      company-idle-delay 0.2
      company-minimum-prefix-length 3
      evil-snipe-scope 'buffer
      evil-snipe-spillover-scope 'while-buffer
      org-table-number-regexp "nil")

(add-to-list 'exec-path (concat home-directory "/.pyenv/shims"))
(add-to-list 'exec-path (concat home-directory "/.cargo/bin"))
(add-to-list 'exec-path (concat home-directory "/.nodenv/shims"))

;; open bigger Window in GUI mode
(if (window-system)
  (set-frame-size (selected-frame) 140 55))

(add-to-list 'auto-mode-alist '("\\.dig\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.gradle\\'" . groovy-mode))
(add-to-list 'auto-mode-alist '("\\.tf\\'" . terraform-mode))
(add-to-list 'auto-mode-alist '("\\.tfvars\\'" . terraform-mode))

(add-hook 'prog-mode-hook 'whitespace-mode)

(add-hook 'terraform-mode-hook #'terraform-format-on-save-mode)

(map!
  :gnvime [M-right]  #'evil-window-right
  :gnvime [M-left]   #'evil-window-left
  :gnvime [M-up]     #'evil-window-up
  :gnvime [M-down]   #'evil-window-down
  :gnvime [M-w]      #'evil-delete-window
  :ne "M-RET"        #'toggle-frame-fullscreen

  (:leader
    (:desc "file" :prefix "f"
           :desc "Browse files"            :n "f"   #'find-file)

    (:desc "project" :prefix "p"
           :desc "Find file in project" :n "f" #'projectile-find-file
           :desc "Invalidate cache" :n "i" #'projectile-invalidate-cache)

    (:desc "search" :prefix "/"
           :desc "Ripgrep"                :nv "/" #'+ivy:rg)

    (:desc "open" :prefix "o"
           :desc "Password manager" :n "p" #'+pass/ivy
           :desc "Terminal in project"   :n  "t" #'+term/open-popup-in-project)
  )
)

(provide 'config)
;;; config.el ends here
