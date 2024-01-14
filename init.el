;;clean emacs init file
(setq custom-file "~/.emacs.d/garbage.el")

;; Clean Interface
(setq inhibit-startup-message t)
(setq ring-bell-function 'ignore)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Font and Font-Size
(set-face-attribute 'default nil :height 130)

;; Line numbers and autoclose parathensis when programming
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'electric-pair-mode)

;; Column Number in mode-line
(column-number-mode)

;; Package Archives
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;;Magit
(use-package magit)

;;Vertico
(use-package vertico
  :ensure t
  :custom
  (vertico-cycle t)
  :init
  (vertico-mode))

;;WhichKey
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq
   which-key-side-window-location 'right
   which-key-idle-delay 0.3))

;;org-mode
(use-package org
  :config
  (setq org-startup-indented t)
  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)
  (setq org-agenda-files '("~/Documents/org-files")))

(use-package org-bullets
    :ensure t
        :init
        (add-hook 'org-mode-hook (lambda ()
                            (org-bullets-mode 1))))

;;eglot
(add-hook 'prog-mode-hook #'eglot-ensure)

;;company
(use-package company
  :ensure t)
(setq company-minimum-prefix-length 2
      company-idle-delay 0.2)
(add-hook 'prog-mode-hook #'company-mode)

;;dired
(use-package dired
  :ensure nil
  :custom ((dired-listing-switches "-al --group-directories-first")))

;;icons
(use-package all-the-icons
  :if (display-graphic-p))
(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

;;Treemacs
(use-package treemacs
  :config
  (setq treemacs-user-mode-line-format 'none))

(use-package treemacs-tab-bar ;;treemacs-tab-bar if you use tab-bar-mode
  :after (treemacs)
  :ensure t
  :config (treemacs-set-scope-type 'Tabs))

;;Kaolin Theme
(use-package kaolin-themes
  :config
  (load-theme 'kaolin-light t)
  (kaolin-treemacs-theme))
