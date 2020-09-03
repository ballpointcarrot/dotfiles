;;; init.el --- Emacs initialization
;;; Code:

(setq user-full-name "Christopher Kruse"
      user-mail-address "ckruse@ballpointcarrot.net")

;; bump GC size (supposedly helps boot time and LSP):
(setq gc-cons-threshold 16000000)

;; prefer 'y' or 'n' to 'yes' or 'no'
(fset 'yes-or-no-p 'y-or-n-p)

;; Set up backup and auto-save file handling:
(setq backup-by-copying t
      backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))
(global-auto-revert-mode 1)

;; Fix indents (I HATE tabs...)
(setq-default indent-tabs-mode nil)
(setq-default whitespace-style
              '(face tabs spaces trailing lines-tail newline empty indentation::space space-before-tab::space))
(setq-default whitespace-line-column 120)

;; Save the place from the last time you touched a file:
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; Global adjustments that I like over defaults
(autoload 'zap-up-to-char "misc"
  "Kill up to, but not including ARGth occurrence of CHAR.
  \(fn arg char)"
  'interactive)
(global-set-key (kbd "M-z") 'zap-up-to-char)
(put 'upcase-region 'disabled nil)

(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Small tweaks/performance fixes
(setq auto-window-vscroll nil) ; reduces lag on holding scroll key

;; Load other files:
(load "~/.emacs.d/packages.el")
(load "~/.emacs.d/visual.el")
(load "~/.emacs.d/eshell.el")
(load "~/.emacs.d/org-cfg.el")
(if (file-exists-p "~/.emacs.d/init-local.el")
    (load "~/.emacs.d/init-local.el"))

;;; init.el ends here
