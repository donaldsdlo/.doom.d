;;your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Donald Lo"
      user-mail-address "donald.sd.lo@gmail.com")
;;(load-file "~/.emacs.d/.local/straight/build/org-download/org-download.el")
;;(require 'org-download)
;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-one)
(setq-default doom-theme 'doom-solarized-dark)
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;;设置默认的字符集为utf-8
(prefer-coding-system 'utf-8)
(setenv "LANG" "en_US.UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LC_CTYPE" "en_US.UTF-8")

;;UI的设置
(display-time-mode 1)
(column-number-mode 1)
(show-paren-mode nil)
(display-battery-mode 1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(global-auto-revert-mode t)
(global-hl-line-mode nil)
(fset 'yes-or-no-p 'y-or-n-p)
(toggle-frame-maximized)

(setq tab-width 4
      inhibit-splash-screen t
      initial-scratch-message nil
      sentence-end-double-space nil
      make-backup-files nil
      indent-tabs-mode nil
      make-backup-files nil
      auto-save-default nil)
(setq create-lockfiles nil)


(if (not (display-graphic-p)) (progn
                                ;; 增大垃圾回收的阈值，提高整体性能(内存换效率)
                                (setq gc-cons-threshold (* 8192 8192))
                                ;; 增大同LSP服务器交互时的读取文件的大小
                                (setq read-process-output-max (* 1024 1024 128)) ;; 128MB
                                ))


(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

(let ((display-table (or standard-display-table (make-display-table))))
  (set-display-table-slot display-table 'vertical-border (make-glyph-code ?│)) ; or ┃ │
  (setq standard-display-table display-table))
(set-face-background 'vertical-border (face-background 'default))
(set-face-foreground 'vertical-border "grey")

(use-package emacs
  :config
  (setq display-line-numbers-type 'relative)
  (global-display-line-numbers-mode t)
  )


(toggle-truncate-lines 1)
(print "1")
;;设置光标为红色
;;(setq-default evil-emacs-state-cursor '("red" bar))
(setq-default cursor-type 'hbar)

(use-package company-tabnine :ensure t)
(add-to-list 'company-backends #'company-tabnine)
(setq company-idle-delay 0)
(setq company-show-numbers t)

(after! org
  (dolist (face '(org-level-1
                  org-level-2 org-level-3
                  org-level-4 org-level-5
                  org-level-6 org-level-7
                  org-level-8))(set-face-attribute face nil :weight 'normal))
  )


;; ** edit
;; *** company
(after! company-box
  (setq company-box-max-candidates 10))

(after! company
  ;; **** config
  ;; 触发补全的length
  (setq company-minimum-prefix-length 2)
  ;; 禁用 line num in company
  (setq company-show-numbers t)
  ;; 触发延迟
  (setq company-idle-delay 0)
  ;; **** company-ui
  (setq company-tooltip-limit 10
        company-tooltip-minimum-width 80
        company-tooltip-minimum 10
        company-backends
        '(company-dabbrev company-dabbrev-code company-capf company-files company-yasnippet)
        ;; global 的排除
        company-global-modes '(not comint-mode erc-mode message-mode help-mode gud-mode markdown-mode org-mode gfm-mode))
  ;; enable global
  (global-company-mode)
  )

(set-company-backend! 'prog-mode
  'company-tabnine 'company-capf 'company-yasnippet 'company-files 'company-dabbrev 'company-dabbrev-code)
(setq +lsp-company-backend '(company-lsp :with company-tabnine :separate))

;; 启动 auto save
;; use-packge 中的 :after 其实不等于 after!
;; 其实指的是这个 package 会在什么情形下 load
(use-package! auto-save
  :init
  (setq auto-save-silent t)
  (setq auto-save-idle 3)
  :commands
  auto-save-enable)

(after! auto-save
  (auto-save-enable)
  )
(print "2")
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

(print "3")

(use-package org-download
  :ensure t
  ;;将截屏功能绑定到快捷键：Ctrl + Shift + Y
  :bind ("C-S-y" . org-download-screenshot)
  :config
  (require 'org-download)
  (setq-default org-download-method 'directory)
  ;; Drag and drop to Dired
  (add-hook 'dired-mode-hook 'org-download-enable)
  )

(defun my-org-download-clipboard()
  (interactive)
  (org-download-clipboard "screenshot.png")
  )
(map! :leader
      :desc "org download clipboard"
      "z c" #'org-download-clipboard
      )
(setq-default org-download-heading-lvl 0)
(setq org-display-inline-images t)


;;(add-hook 'java-mode-hook #'lsp)
;;(setq lsp-java-server-install-dir '~/Downloads/jdt-language-server-latest)

;; set font
;;(set-default-font -*-Source Code Pro-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1 )
(setq doom-font (font-spec :family "JetBrains Mono" :size 14)
      doom-big-font (font-spec :family "JetBrains Mono" :size 16)
      ;;doom-variable-pitch-font (font-spec :family "Overpass" :size 16)
      doom-serif-font (font-spec :family "IBM Plex Mono" :weight 'light))
(print "4")

(map! :leader
      :desc "format all buffer"
      "z f" #'format-all-buffer)

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
(print "6")
(defun org-load-buffer (filename &rest args)
  (interactive)
  (print filename)
  (setq-default org-download-heading-lvl 0)
  (print (file-name-extension filename))
  (print (concat (file-name-sans-extension filename) "-images"))
  (if (string-equal "org" (file-name-extension filename))
      (progn
      (setq org-download-image-dir (concat (file-name-sans-extension filename) "-images"))
      (setq org-download-heading-lvl 0)
        )
    )
  )
(advice-add 'create-file-buffer :after #'org-load-buffer)

(print "7")
(defun org-download-dir-1-override ()
  (interactive)
  (print "org-download--dir-1-override")
  (print (buffer-file-name (current-buffer)))
      ;;(return (concat (file-name-sans-extension (buffer-file-name)) "-images"))
  (setq org-download-image-dir (concat (file-name-sans-extension (buffer-file-name (current-buffer))) "-images"))
  (or (concat (file-name-sans-extension (buffer-file-name (current-buffer))) "-images") ".")
  )
(print "8")
(advice-add #'org-download--dir-1 :override #'org-download-dir-1-override)
(print "9")
(defun org-download-dir-2-before()
  (print "org-download--dir-2-before")
  (print (buffer-file-name))
  (if (eq org-download-heading-lvl nil)
      (setq org-download-heading-lvl 0)
      )
  )
(advice-add  #'org-download--dir-2 :before #'org-download-dir-2-before)
(print "10")

(defun org-image-delete()
  (interactive)
  (save-excursion
    (print (file-name-directory (buffer-file-name (current-buffer))))
    (print org-download-image-dir)
    (goto-char (line-beginning-position))
    (re-search-forward "\\[\\[download:\\([^]]*\\)\\]\\]" (line-end-position) t)
    (let ((str (match-string-no-properties 1)))
      (print str)
      (let ((filename  (concat org-download-image-dir "/" str)))
        (print filename)
        (when (file-exists-p filename)
          (progn
            (print "file exists")
          (delete-file filename)
          (evil-delete (line-beginning-position) (line-end-position))
          )
        )
        )
    )
  )
 )

(defun org-download--at-comment-p-override ()
  (print "org-download--at-comment-p-override")
  (save-excursion
    (move-beginning-of-line nil)
    )
  )
(advice-add #'org-download--at-comment-p :override #'org-download--at-comment-p-override)
(print "5")
(
 map! :leader
 :desc "org download delete"
 "z d" #'org-image-delete
 )
(company-childframe-mode 1)
(company-posframe-mode 1)
;; display at `ivy-posframe-style'
(setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display)))
(setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-window-center)))
;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-bottom-left)))
;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-window-bottom-left)))
;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-top-center)))
(ivy-posframe-mode 1)

(which-key-posframe-mode 1)

(setq which-key-posframe-poshandler 'posframe-poshandler-frame-center)

;;自动切换主题
(use-package circadian
  :config
  (setq calendar-latitude 22.6)
  (setq calendar-longitude 114.0)
  (if (display-graphic-p)
    (setq circadian-themes '((:sunrise . doom-nord-light)
                             (:sunset . doom-nord)))
    (setq circadian-themes '((:sunrise . spacemacs-light)
                             (:sunset . nord))))
  (circadian-setup))

;;set transparent effect
;; (global-set-key [(f2)] 'loop-alpha)
;; (setq alpha-list '((100 100) (95 65) (85 55) (75 45) (65 35)))
;; (defun loop-alpha ()
;;   (interactive)
;;   (let ((h (car alpha-list)))                ;; head value will set to
;;     ((lambda (a ab)
;;        (set-frame-parameter (selected-frame) 'alpha (list a ab))
;;        (add-to-list 'default-frame-alist (cons 'alpha (list a ab)))
;;        ) (car h) (car (cdr h)))
;;     (setq alpha-list (cdr (append alpha-list (list h))))
;;     )
;; )


;;(global-wakatime-mode)
;;

(require 'java-imports)
;; whatever you want to bind it to
(define-key! java-mode-map (kbd "M-I") 'java-imports-add-import-dwim)

;; See customization below for where to put java imports
(setq java-imports-find-block-function 'java-imports-find-place-sorted-block)
(add-hook 'java-mode-hook 'java-imports-scan-file)
