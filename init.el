;; configure emacs tutorial
;; https://lucidmanager.org/productivity/configure-emacs/

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; use-package to simplify the config file
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure 't)

;; Keyboard-centric user interface
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(defalias 'yes-or-no-p 'y-or-n-p)

;; Theme
;; exotica, afternoon, zenburn
(use-package zenburn-theme
  :config (load-theme 'zenburn t))

(use-package which-key
  :config
  (which-key-mode))

(setq ispell-program-name (executable-find "hunspell")
      ispell-dictionary "de_DE") ;; en_US, de_DE

(add-hook 'text-mode-hook 'flyspell-mode)

(require 'eglot)
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)

(load "/usr/share/emacs/site-lisp/clang-format-14/clang-format.el")










