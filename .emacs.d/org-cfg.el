;;; org-cfg.el -- Summary
;;; Commentary:
;;; org-mode configuration for global usage

;;; Code:
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c c") 'org-capture)

(setq org-agenda-files (quote ("~/Notes/" "~/Calendar/" "~/GTD/")))
(setq org-todo-keywords
      '((sequence "TODO" "PENDING" "DONE")))

(setq org-directory "~/GTD")
(setq org-default-notes-file (concat org-directory "/in.org"))
(setq org-refile-targets '((org-agenda-files . (:maxlevel . 6))))


(setq org-capture-templates
      '(("t" "todo" entry (file org-default-notes-file)
         "* TODO %?\n%U\n%a\n")
        ("n" "note" entry (file org-default-notes-file)
         "* %? :NOTE:\n%U\n%a\n")
        ))

;;; org-cfg.el ends here
