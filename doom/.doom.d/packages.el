;; -*- no-byte-compile: t; -*-

(package! shell-pop)

(package! terraform-mode)

(package! format-sql)

(package! osx-clipboard)

(def-package! tern
  :hook (js2-mode . tern-mode))

(def-package! company-tern
  :after company-mode
  :hook ((js2-mode . tern-mode)
         (js2-mode . company-mode))
  :init
  (add-to-list 'company-backends 'company-tern))
