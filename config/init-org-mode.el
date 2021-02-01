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
;; (org-indent-mode -1)
;; (add-hook 'org-mode-hook #'valign-mode)
;;
;;

;; (defun my-org-screenshot (basename)
;;   "Take a screenshot into a time stamped unique-named file in the
;; same directory as the org-buffer and insert a link to this file."
;;   (interactive "sScreenshot name: ")
;;   (if (equal basename "")
;;       (setq basename (format-time-string "%Y%m%d_%H%M%S")))
;;   (setq filename
;;         (concat (file-name-directory (buffer-file-name))
;;                 "imgs/"
;;                 (file-name-base (buffer-file-name))
;;                 "_"
;;                 basename
;;                 ".png"))
;;   (call-process "screencapture" nil nil nil "-s" filename)
;;   (insert "#+CAPTION:")
;;   (insert basename)
;;   (insert "\n")
;;   (insert (concat "[[" filename "]]"))
;;   (org-display-inline-images))



(provide 'init-org-mode)
