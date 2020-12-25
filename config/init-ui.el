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

(use-package emacs
  :config
  (setq display-line-numbers-type 'relative)
  (global-display-line-numbers-mode t)
  )
(toggle-truncate-lines 1)


(setq doom-font (font-spec :family "Fira Code" :size 14)
      doom-big-font (font-spec :family "Fira Code" :size 16)
      doom-variable-pitch-font (font-spec :family "Fira Code" :size 16)
      doom-serif-font (font-spec :family "Fira Code" :weight 'light))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))
;;Titlebar
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(let ((display-table (or standard-display-table (make-display-table)))) (set-display-table-slot display-table 'vertical-border (make-glyph-code ?│))
     (setq standard-display-table display-table))
(set-face-background 'vertical-border (face-background 'default))
(set-face-foreground 'vertical-border "grey")

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

(provide 'init-ui)
