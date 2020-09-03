;;; Visual settings

;; scrolling
(setq scroll-margin 5
      scroll-preserve-screen-position 1)

;; inside
(setq split-width-threshold nil)
(setq split-height-threshold 0)
(global-linum-mode 1)

;; functionality
(setq inhibit-startup-screen t)
(setq-default fill-column 120)
(setq select-enable-clipboard t)
(prefer-coding-system 'utf-8)

;; remove bounding entities
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(if 'scroll-bar-mode
    (scroll-bar-mode 0))

(unless window-system
  (setq evil-esc-delay 0)
  (eval-after-load 'flycheck
    '(progn
       (set-face-attribute 'flycheck-error nil :background "red")
       (set-face-attribute 'flycheck-warning nil :background "yellow" :foreground "red")
       (set-face-attribute 'flycheck-info nil :background "yellow" :foreground "black")
       )))

;; GUI-based improvements
(when window-system
  ;; font options:
  ;; FuraCode NF/medium/104
  ;; DroidSansMono NF/medium/110
  ;; InconsolataGo NF/medium/120
  ;; "Iosevka Term,Iosevka NF" :weight 'medium :height 110
  ;; "MesloLGL NF" :weight 'medium :height 110
  ;; "mononoki NF" :weight 'medium :height 110
  ;; "NotoMono NF" :weight 'medium :height 110
  ;;
  (set-face-attribute 'default nil :family "FuraCode Nerd Font Mono" :weight 'medium :height 110)
)

;; Themes
(defun set-theme (theme)
  (interactive)
  (load-theme theme t))

(defun set-light-theme ()
  "Set a light theme over all instances of the editor."
  (interactive)
  (set-theme 'flatui))

(defun set-dark-theme ()
  "Set a dark theme over all instances of the editor."
  (interactive)
  (kaolin-temple-theme))
  ;(set-theme 'challenger-deep))

;(set-dark-theme)
