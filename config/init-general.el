;;设置默认的字符集为utf-8
(prefer-coding-system 'utf-8)
(setenv "LANG" "en_US.UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LC_CTYPE" "en_US.UTF-8")



(setq tab-width 4
      inhibit-splash-screen t
      initial-scratch-message nil
      sentence-end-double-space nil
      make-backup-files nil
      indent-tabs-mode nil
      make-backup-files nil
      auto-save-default nil
      ring-bell-function 'ignore ;;到buffer开头和结尾处的轰鸣声关掉
      )
(setq create-lockfiles nil)


(if (not (display-graphic-p)) (progn
                                ;; 增大垃圾回收的阈值，提高整体性能(内存换效率)
                                (setq gc-cons-threshold (* 8192 8192))
                                ;; 增大同LSP服务器交互时的读取文件的大小
                                (setq read-process-output-max (* 1024 1024 128)) ;; 128MB
                                ))
(require 'popwin)
(popwin-mode t)


(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table
  '(
    ("8ls" "zilongsanren")
    )
  )

(global-auto-revert-mode t)

(delete-selection-mode t)

(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max))
  )

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indented selected region."))
      (progn
        (indent-buffer)
        (message "Indented buffer."))))
  )
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)
(setq-default window-numbering-mode t)
(setq window-numbering-assign-func
      (lambda () (when (equal (buffer-name) "*Calculator*") 9)))


;;which-keys
;;
(setq which-key-idle-delay 0.1) ;; I need the help, I really do
;;
(setq which-key-allow-multiple-replacements t)
(after! which-key
  (pushnew!
   which-key-replacement-alist
   '(("" . "\\`+?evil[-:]?\\(?:a-\\)?\\(.*\\)") . (nil . "◂\\1"))
   '(("\\`g s" . "\\`evilem--?motion-\\(.*\\)") . (nil . "◃\\1"))
   ))




(provide 'init-general)
