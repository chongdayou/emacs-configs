(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages '(yaml-mode dockerfile-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ============================================================
;; Package Management
;; ============================================================
;; Initialize Package Manager
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Install Docker and YAML mode
(unless (package-installed-p 'dockerfile-mode)
  (package-refresh-contents)
  (package-install 'dockerfile-mode))
(unless (package-installed-p 'yaml-mode)
  (package-install 'yaml-mode))

;; ============================================================
;; Custom Configurations
;; ============================================================
;; Use dockerfile-mode for files named Dockerfile
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
;; Use yaml-mode for .yml and .yaml files
(add-to-list 'auto-mode-alist '("\\.ya?ml\\'" . yaml-mode))
;; sh-mode for .env files
(add-to-list 'auto-mode-alist '(".env\\'" . sh-mode))

;; central storage for backup files
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
;; Better line numbers for coding
(global-display-line-numbers-mode 1)
;; Keeps the line number gutter stable
(setq-default display-line-numbers-width 3)
;; Show syntax highlighting
(global-font-lock-mode 1)

;; Highlight matching parentheses
(show-paren-mode 1)

;; Use spaces instead of tabs (4 spaces)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Answer with 'y/n' instead of typing 'yes/no'
(defalias 'yes-or-no-p 'y-or-n-p)


