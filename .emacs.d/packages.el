(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; Requires only to set the mode

(eval-after-load "smartparens-autoloads"
  '(progn
     (smartparens-mode t)))

(eval-after-load "undo-tree-autoloads"
  '(progn
     (global-undo-tree-mode t)))

(eval-after-load "which-key-autoloads"
  '(progn
     (which-key-mode)))

(eval-after-load "yasnippet-autoloads"
  '(progn
     (yas-global-mode t)))

;; Requires addition of mode into hooks:

(eval-after-load "aggressive-indent-autoloads"
  '(progn
     (add-hook 'prog-mode-hook #'aggressive-indent-mode)))

(eval-after-load "rainbow-delimiters-autoloads"
  '(progn
     (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
     (add-hook 'prog-mode-hook #'electric-pair-mode)))

(eval-after-load "company-autoloads"
  '(progn
     (add-hook 'prog-mode-hook #'company-mode)))

(eval-after-load 'web-mode-autoloads
  '(progn
     (add-to-list 'auto-mode-alist '(".jsp" . web-mode))))

(eval-after-load "parinfer-autoloads"
  '(progn
     (add-hook 'lisp-mode-hook #'parinfer-mode)
     (add-hook 'emacs-lisp-mode-hook #'parinfer-mode)))

;; (eval-after-load "evil-autoloads"
;;   '(progn
;;      ;;     (evil-mode t)
;;      (add-hook 'prog-mode-hook #'evil-mode)))
;; (evil-set-initial-state 'erc-mode 'emacs)))

(eval-after-load "origami-autoloads"
  '(progn
     (add-hook 'prog-mode-hook #'origami-mode)))
;; Requires additional configuration.

(eval-after-load "avy-autoloads"
  '(progn
     (setq avy-keys '(?a ?o ?e ?u ?i ?d ?h ?t ?n ?s))
     (global-set-key (kbd "C-c C-g") 'avy-goto-char)
     (global-set-key (kbd "C-j") 'avy-goto-word-0)
     (global-set-key (kbd "C-c w") 'avy-goto-word-1)))

(eval-after-load "multiple-cursors-autoloads"
  '(progn
     (global-set-key (kbd "C->") 'mc/mark-next-like-this)
     (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
     (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
     (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)))

(eval-after-load "cask-autoloads"
  '(progn
     (add-to-list 'auto-mode-alist '("Cask\\'" . lisp-mode))))

(eval-after-load "swiper-autoloads"
  '(progn
     (ivy-mode 1) 
     ;; Ivy replacements to standard emacs commands
     (global-set-key (kbd "C-s") 'swiper)
     (global-set-key (kbd "M-x") 'counsel-M-x)
     (global-set-key (kbd "C-x C-f") 'counsel-find-file)
     (global-set-key (kbd "C-c C-r") 'ivy-resume)
     (global-set-key (kbd "<f1> f") 'counsel-describe-function)
     (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
     (global-set-key (kbd "<f1> l") 'counsel-load-library)
     (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
     (global-set-key (kbd "<f2> u") 'counsel-unicode-char)

     ;; Ivy interfaces to shell tools
     (global-set-key (kbd "C-c g") 'counsel-git)
     (global-set-key (kbd "C-c j") 'counsel-git-grep)
     (global-set-key (kbd "C-c k") 'counsel-ag)))

(eval-after-load "ido-vertical-mode-autoloads"
  '(progn
     (ido-mode 1)
     (ido-everywhere 1)
     (ido-vertical-mode 1)
     (setq ido-vertical-define-keys 'C-n-C-p-up-and-down)))

(eval-after-load "ido-ubiquitous-autoloads"
  '(progn
     (ido-ubiquitous-mode 1)))
