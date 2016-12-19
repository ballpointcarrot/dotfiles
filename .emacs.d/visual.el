;;; Visual settings

;; scrolling
(setq scroll-margin 5
      scroll-preserve-screen-position 1)

;; inside
(set-fringe-mode '(10 . 0))
(setq split-width-threshold nil)
(setq split-height-threshold 0)
(global-linum-mode 1)

;; functionality
(setq inhibit-startup-screen t)
(setq-default fill-column 120)
(setq x-select-enable-clipboard t)
(prefer-coding-system 'utf-8)

;; remove bounding entities
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; GUI-based improvements
(when window-system
  (set-face-attribute 'default nil :family "Source Code Pro" :weight 'medium :height 90)
  (scroll-bar-mode 0)
  )

;; Themes
(defun set-theme (theme)
  (interactive)
  (if (not (boundp 'moe-theme))
      (require 'moe-theme))
  (load-theme theme t))

(set-theme 'leuven)
