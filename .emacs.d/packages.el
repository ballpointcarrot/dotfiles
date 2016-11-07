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

(eval-after-load "auto-complete-autoloads"
  '(progn
     (global-auto-complete-mode t)))

;; Requires addition of mode into hooks:

(eval-after-load "aggressive-indent-autoloads"
  '(progn
     (add-hook 'prog-mode-hook #'aggressive-indent-mode)))

(eval-after-load "rainbow-delimiters-autoloads"
  '(progn
     (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
     (add-hook 'prog-mode-hook #'electric-pair-mode)))

;; (eval-after-load "evil-autoloads"
;;   '(progn
;;      (evil-mode t)
;;      (add-hook 'prog-mode-hook #'evil-mode)
;;      (evil-set-initial-state 'erc-mode 'emacs)))

;; Requires additional configuration.

(eval-after-load "avy-autoloads"
  '(progn
     (setq avy-keys '(?a ?o ?e ?u ?i ?d ?h ?t ?n ?s))
     (global-set-key (kbd "C-c C-SPC") 'avy-goto-char)
     (global-set-key (kbd "C-c w") 'avy-goto-word-1)))

;; (eval-after-load "helm-autoloads"
;;   '(progn
;;      (helm-mode 1)
;;      (global-set-key "\M-x" 'helm-M-x)
;;      (global-set-key (kbd "C-c h") 'helm-mini)
;;      (global-set-key (kbd "C-x C-f") 'helm-find-files)))

(eval-after-load "multiple-cursors-autoloads"
  '(progn
     (global-set-key (kbd "C->") 'mc/mark-next-like-this)
     (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
     (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
     (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)))

;; (eval-after-load "helm-projectile-autoloads"
;;   '(progn
;;      (projectile-global-mode)
;;      (setq projectile-completion-system 'helm)
;;      (helm-projectile-on)))

(eval-after-load "cask-autoloads"
  '(progn
     (add-to-list 'auto-mode-alist '("Cask\\'" . lisp-mode))))

;; (eval-after-load "smex-autoloads"
;;   '(progn
;;      (smex-initialize)
;;      (global-set-key (kbd "M-x") 'smex)
;;      (global-set-key (kbd "M-X") 'smex-major-mode-commands)))

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
     (global-set-key (kbd "C-c k") 'counsel-ag)

     ;;(global-set-key (kbd "C-x l") 'counsel-locate)
     ;;(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
     ))

(eval-after-load "ido-vertical-mode-autoloads"
  '(progn
     (ido-mode 1)
     (ido-everywhere 1)
     (ido-vertical-mode 1)
     (setq ido-vertical-define-keys 'C-n-C-p-up-and-down)))

(eval-after-load "ido-ubiquitous-autoloads"
  '(progn
     (ido-ubiquitous-mode 1)))
