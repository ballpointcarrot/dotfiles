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
(setq x-select-enable-clipboard t)
(prefer-coding-system 'utf-8)

;; remove bounding entities
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

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
  (set-face-attribute 'default nil :family "NotoMono NF" :weight 'medium :height 110)
  (if 'scroll-bar-mode
      (scroll-bar-mode 0)))

;; Themes
(defun set-theme (theme)
  (interactive)
  (load-theme theme t))

(defun set-light-theme ()
  (interactive)
  (set-theme 'flatui))

(defun set-dark-theme ()
  (interactive)
  (if window-system
      (set-theme 'exotica)
    (set-theme 'monokai)))

(set-dark-theme)
