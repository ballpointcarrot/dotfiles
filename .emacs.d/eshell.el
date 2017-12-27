;;; eshell.el --- Eshell definitions and customizations.
;;; Code:

;; set Eshell path.
(let ((path (shell-command-to-string "source ~/.zshrc; echo -n $PATH")))
  (setenv "PATH" path)
  (setq exec-path
	(append
	 (split-string-and-unquote path ":")
	 exec-path)))

;; don't modify the eshell buffer, jump to the bottom on input
(setq eshell-scroll-to-bottom-on-input t)

;; Aliases

(defalias 'e 'find-file)
(defalias 'vim 'find-file)
(defalias 'ff 'find-file)
(defalias 'ee 'find-file-other-window)
(defalias 'ffow 'find-file-other-window)
(defalias 'emacs 'find-file-other-window)

;; anything use $PAGER should just write outright.
(add-hook 'eshell-mode-hook
	  (lambda ()
	    (setenv "PAGER" "cat")))

;; Run commands through 'visual' (closer to ANSI term)
(add-hook 'eshell-mode-hook
	  (lambda ()
	    (add-to-list 'eshell-visual-commands "ssh")
	    (add-to-list 'eshell-visual-commands "tail")))

;;; End eshell.el

