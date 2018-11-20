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

(use-package undo-tree
  :config
  (global-undo-tree-mode t))

(use-package which-key
  :config
  (which-key-mode))

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
  (prog-mode . rainbow-delimiters-mode)
  :config
  (use-package color :ensure nil
    :commands color-saturate-name
    :demand t))

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

(use-package origami :hook (prog-mode . origami-mode))

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
         ("C-c k" . counsel-ag)))

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

;; Programming-specific.

(use-package flycheck
  :commands flycheck-mode
  :config
  (defalias 'flycheck-show-error-at-point-soon 'flycheck-show-error-at-point))

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

(use-package flycheck-clojure)
(use-package clj-refactor)
(use-package clojure-mode-extra-font-locking)

(use-package web-mode)
(use-package json-mode)
(use-package js2-mode
  :mode ("\\.js\\'" "\\.jsx\\'" "\\.json\\'")
  :config
  (use-package js2-refactor
    :hook (js2-mode . js2-refactor-mode)))
(use-package restclient
  :config (use-package company-restclient))

(use-package yaml-mode)

(use-package toml-mode)
(use-package company-racer)

(use-package dockerfile-mode)
(use-package docker-compose-mode)

;; Rust
(use-package lsp-rust
  :config
  (use-package lsp-mode))

(use-package rust-mode
  :init
  (lsp-define-stdio-client
   rust-mode
   "rust"
   #'lsp-rust--get-root
   (lsp-rust--rls-command))
  :config
  (use-package flycheck-rust)
  :hook
  ((flycheck-mode . flycheck-rust-setup) (rust-mode . flycheck-mode)))

;; Packages that make things pretty.
(use-package flatui-theme :no-require t)
(use-package flatui-dark-theme :no-require t)
(use-package monokai-theme :no-require t)
(use-package exotica-theme :no-require t)
(use-package leuven-theme :disabled)
(use-package emojify)
(use-package password-store)

;; Packages not requiring configuration.
(use-package circe)
(use-package bbdb)
(use-package org)
(use-package markdown-mode)
(use-package magit)
(use-package smex)
(use-package idle-highlight-mode)
