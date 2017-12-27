;;; init.el --- Emacs initialization
;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq user-full-name "Christopher Kruse"
      user-mail-address "ckruse@ballpointcarrot.net")

;; prefer 'y' or 'n' to 'yes' or 'no'
(fset 'yes-or-no-p 'y-or-n-p)

;; Set up backup and auto-save file handling:
(setq backup-by-copying t
      backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))
(global-auto-revert-mode 1)

;; Fix indents (I HATE tabs...)
(setq-default indent-tabs-mode nil)
(setq whitespace-style
      '(face tabs spaces trailing lines-tail newline empty indentation::space space-before-tab::space))
(setq whitespace-line-column 120)

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

;; Load other files:
(load "~/.emacs.d/packages.el")
(load "~/.emacs.d/visual.el")
(load "~/.emacs.d/eshell.el")
(load "~/.emacs.d/org-cfg.el")
(if (file-exists-p "~/.emacs.d/init-local.el")
    (load "~/.emacs.d/init-local.el"))

;;; init.el ends here
