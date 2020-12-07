;; Set up (use-package).
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))

(setq package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(require 'bind-key)

(setq use-package-verbose t
      use-package-always-ensure t)

;; Packages which make my environment useful.

(use-package ido-vertical-mode
  :init
  (setq ido-vertical-define-keys 'C-n-C-p-up-and-down)
  :config
  (ido-mode 1)
  (ido-vertical-mode 1)
  (ido-everywhere 1))

(use-package ido-completing-read+
  :config
  (ido-ubiquitous-mode 1))

(use-package smartparens
  :config
  (smartparens-global-mode 1))

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

(use-package undo-tree
  :config
  (global-undo-tree-mode t))

(use-package which-key
  :config
  (which-key-mode))

(use-package evil
  :ensure t
  :init
  (setq evil-search-module 'evil-search
        evil-ex-complete-emacs-commands nil
        evil-vsplit-window-right t
        evil-split-window-below t
        evil-shift-round nil
        evil-want-C-u-scroll t)
  :config
  (use-package evil-surround
    :hook (prog-mode . evil-surround-mode))
  (use-package origami
    :hook (prog-mode . origami-mode))
  (evil-mode)
  (define-key evil-normal-state-map (kbd ", w") 'evil-window-vsplit)
  (define-key evil-normal-state-map (kbd ", h") 'evil-window-split)
  (define-key evil-normal-state-map (kbd "z f") 'origami-close-node)
  (define-key evil-normal-state-map (kbd "z o") 'origami-open-node))

(use-package yasnippet
  :config
  (yas-global-mode t)
  (use-package yasnippet-snippets))

(use-package aggressive-indent
  :config
  (global-aggressive-indent-mode t)
  (dolist (item  '(emacs-lisp-mode lisp-mode html-mode))
    (add-to-list 'aggressive-indent-excluded-modes item)))

(use-package rainbow-delimiters
  :commands rainbow-delimiters-mode
  :hook
  (prog-mode . rainbow-delimiters-mode))

(use-package company
  :commands global-company-mode
  :hook (prog-mode . company-mode)
  :config
  (setq company-tooltip-limit 10
        company-idle-delay 0.2
        company-dabbrev-downcase nil
        company-echo-delay 0
        company-minimum-prefix-length 3
        company-require-match nil
        company-selection-wrap-around t
        company-tooltip-align-annotations t
        company-tooltip-flip-when-above t
        company-transformers '(company-sort-by-occurrence))
  (bind-keys :map company-active-map
             ("C-p" . company-select-previous)
             ("C-n" . company-select-next)
             ("TAB" . company-complete-common-or-cycle)))

(use-package parinfer
  :init
  (setq parinfer-extensions '(defaults smart-yank))
  :hook
  ((lisp-mode . parinfer-mode) (emacs-lisp-mode . parinfer-mode)))

(use-package avy
  :init
  (setq avy-keys '(?a ?o ?e ?u ?i ?d ?h ?t ?n ?s)) ; Because Dvorak.
  (setq avy-case-fold-search nil)
  (setq avy-style 'at)
  :bind (("C-c C-g" . avy-goto-char)
         ("C-j" . avy-goto-word-0)
         ("C-c w" . avy-goto-word-1)))

(use-package multiple-cursors
  :bind (("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)
         ("C-S-c C-S-c" . mc/edit-lines)))

(use-package swiper
  :config
  (ivy-mode 1)
  :bind (("C-s" . swiper)
         ("C-c C-r" . ivy-resume)))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-c g" . counsel-git)
         ("C-c j" . counsel-git-grep)
         ("C-c k" . counsel-rg)))

(use-package linum-relative
  :init
  (setq linum-relative-current-symbol "")
  :config
  (linum-on)
  (linum-relative-global-mode t)
  (column-number-mode t))

(use-package treemacs
  :ensure t
  :defer t
  :config
  (setq treemacs-width 20)
  :bind
  (:map evil-normal-state-map
        ("\\" . treemacs)))

(use-package treemacs-evil
  :after evil treemacs
  :ensure t)

(use-package persp-mode
  :config
  (persp-mode))

(use-package treemacs-persp
  :after treemacs persp-mode
  :ensure t
  :config (treemacs-set-scope-type 'Perspectives))

;; Programming-specific.

(use-package magit
  :config
  (setq git-commit-fill-column 72)
  (git-commit-turn-on-auto-fill))

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(use-package flycheck
  :commands flycheck-mode
  :hook (prog-mode . flycheck-mode)
  :config
  (defalias 'flycheck-show-error-at-point-soon 'flycheck-show-error-at-point)
  (use-package flycheck-popup-tip
    :hook
    (flycheck-mode . flycheck-popup-tip-mode)))

;; Clojure
(use-package clojure-mode
  :mode ("\\.clj\\'" "\\.cljs\\'" "\\.cljc\\'")
  :config
  (use-package cljsbuild-mode))

(use-package cider
  :commands cider-mode
  :init
  (with-eval-after-load 'clojure-mode
    (add-hook 'clojure-mode-hook #'cider-mode))
  :config
  (setq nrepl-hide-special-buffers t
        cider-repl-pop-to-buffer-on-connect nil
        cider-repl-use-clojure-font-lock t))

(use-package flycheck-joker)
(use-package flycheck-clj-kondo)
(use-package clj-refactor)
(use-package clojure-mode-extra-font-locking)

;; JS/TS and Web
(use-package web-mode
  :mode ("\\.html?\\'" "\\.erb\\'" "\\.mustache\\'")
  :config
  (use-package emmet-mode
    :hook
    ((sgml-mode . emmet-mode) (css-mode . emmet-mode)))
  (use-package company-web
    :hook
    ((web-mode-hook . (lambda ()
                        (set (make-local-variable 'company-backends) '(company-web-html))
                        (company-mode t))))))

(use-package js2-mode
  :mode ("\\.js\\'" "\\.jsx\\'")
  :config
  (setq js-indent-level 2)
  (use-package json-mode
    :init
    (add-hook 'json-mode-hook (lambda ()
                                (make-local-variable 'js-indent-level)
                                (setq js-indent-level 2)))
    :mode ("\\.json\\'"))
  (use-package js2-refactor
    :hook (js2-mode . js2-refactor-mode))
  (setq js-switch-indent-offset js-indent-level))

(use-package typescript-mode
  :after js2-mode
  :mode ("\\.ts\\'" "\\.tsx\\'")
  :init
  (setq typescript-indent-level 2)
  (use-package prettier-js
    :hook ((js2-mode . prettier-js-mode) (typescript-mode . prettier-js-mode))))

(use-package restclient
  :config (use-package company-restclient))

;; LSP
(use-package lsp-mode
  :commands lsp
  :init (setq lsp-disabled-clients '(clojure-lsp)
              gc-cons-threshold (* 100 1024 1024)
              read-process-output-max (* 1024 1024))
  :hook (prog-mode . lsp))

(use-package lsp-ui :commands lsp-ui-mode
    :hook (lsp-mode . lsp-ui-mode)
    :config (setq lsp-ui-sideline-ignore-duplicate t))

(use-package company-lsp :commands company-lsp
  :config
  (setq company-lsp-async t
        company-lsp-cache-candidates 'auto
        company-lsp-enable-recompletion t
        lsp-completion-provider :capf))

;; Rust things.
(use-package toml-mode)

(use-package rustic
  :mode ("\\.rs\\'" . rustic-mode)
  :config
  (use-package cargo
    :hook
    (rust-mode . cargo-minor-mode))
  (setq lsp-ui-doc-enable nil
        rustic-lsp-server 'rust-analyzer))

;; It's cloud native! /s
(use-package yaml-mode)
(use-package dockerfile-mode)
(use-package docker-compose-mode)

;; Packages that make things pretty.
(use-package all-the-icons)
(use-package treemacs-all-the-icons
  :after treemacs all-the-icons)

(use-package flatui-theme :no-require t)
(use-package flatui-dark-theme :no-require t)
(use-package doom-themes
  :config
  (load-theme 'doom-monokai-pro t))
(use-package kaolin-themes :no-require t)
(use-package monokai-theme :no-require t)
(use-package exotica-theme :no-require t)
(use-package challenger-deep-theme :no-require t)
(use-package leuven-theme :disabled)
(use-package emojify)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode t)
  :config (setq doom-modeline-height 14))

;; Packages not requiring configuration.
(use-package circe)
(use-package bbdb)
(use-package org)
(use-package markdown-mode)
(use-package password-store)
(use-package idle-highlight-mode)

(provide 'packages)
;;; packages.el ends here
