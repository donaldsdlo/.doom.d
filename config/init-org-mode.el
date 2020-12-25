;; org-mode
(setq org-todo-keywords
      '((sequence "TODO(t)" "INPROGRESS(i)" "WAITING(w)" "REVIEW(r)" "|" "DONE(d)" "CANCELED(c)")))
(setq org-todo-keyword-faces '(("TODO" . org-warning)
                               ("INPROGRESS" . "yellow") ("WAITING" . "purple") ("REVIEW" . "orange") ("DONE" . "green") ("CANCELED" . "red")))
(use-package org-bullets :config
             (progn
               (setq org-bullets-bullet-list '("☯" "✿" "✚" "◉" "❀")) (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))) ))
(use-package org-alert :defer t
             :config
             (progn
               (setq alert-default-style 'libnotify) ))
;;设置org mode显示图片为1/3
(setq org-image-actual-width (/ (display-pixel-width) 3))

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (plantuml . t)
   )
 )
(setq org-plantuml-jar-path
      (expand-file-name "~/.doom.d/plantuml.jar")
      )

;;让 org-download 不产生 #+DOWNLOAD 的信息
;;(setq org-download-annotate-function (lambda (_link) ""))

(map! :leader
      :desc "org download clipboard"
      "z c" #'org-download-clipboard
      )

(provide 'init-org-mode)
