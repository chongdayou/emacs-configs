;; ============================================================
;; Package Management
;; ============================================================

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
             t)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)


;; ============================================================
;; Packages
;; ============================================================

(use-package dockerfile-mode
  :mode "Dockerfile\\'")

(use-package yaml-mode
  :mode "\\.ya?ml\\'")

(use-package company
  :hook (after-init . global-company-mode)
  :config
  (setq company-idle-delay 0.2)
  (setq company-minimum-prefix-length 2)
  (setq company-selection-wrap-around t))

(use-package company-box
  :hook (company-mode . company-box-mode))


;; ============================================================
;; File Type Associations
;; ============================================================

(add-to-list 'auto-mode-alist '("\\.env\\'" . sh-mode))


;; ============================================================
;; macOS Key Behavior
;; ============================================================

(when (eq system-type 'darwin)
  (setq mac-option-modifier 'meta)
  (setq mac-command-modifier 'super)

  ;; Option + Delete deletes next word
  (global-set-key (kbd "M-DEL") 'kill-word))


;; ============================================================
;; Editing Defaults
;; ============================================================

(setq backup-directory-alist
      `(("." . "~/.emacs.d/backups")))

(global-display-line-numbers-mode 1)
(setq-default display-line-numbers-width 3)

(global-font-lock-mode 1)
(show-paren-mode 1)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(defalias 'yes-or-no-p 'y-or-n-p)


;; ============================================================
;; Custom Variables
;; ============================================================
;; Keep this section at the bottom.
;; Emacs may edit it automatically through Customize.
;; ============================================================

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
