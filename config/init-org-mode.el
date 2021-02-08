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
(defun paste-image-from-clipboard()
  (interactive)
  (let (
        (bf-full-name (buffer-file-name (current-buffer)))
        (bf-directory )
        (bf-filename )
        (bf-extension )
        (bf-image-filename)
        (bf-image-full-filename)
        (bf-image-relative-filename)
        )
    (progn
      (setq bf-directory (file-name-directory bf-full-name))
      (setq bf-filename (file-name-base bf-full-name))
      (setq bf-extension (file-name-extension bf-full-name))
      (setq bf-image-filename (concat (format-time-string "%Y%m%d-%H%M%S") ".png"))
      (setq bf-image-full-filename (concat bf-directory bf-filename "-images/" bf-image-filename))
      (setq bf-image-relative-filename (concat "./" bf-filename "-images/" bf-image-filename))
      (message "bf-image-full-filename:%s" bf-image-full-filename)
      (message "bf-image-relative-filename:%s" bf-image-relative-filename)
      (message "bf-full-name:%s" bf-full-name)
      (message "bf-directory:%s" bf-directory)
      (message "bf-filename:%s" bf-filename)
      (message "bf-extension:%s" bf-extension)
      (shell-command (concat "pngpaste " bf-image-full-filename))
      (insert (concat "[[" bf-image-relative-filename "]]"))
      )
    )
  )


(provide 'init-org-mode)
