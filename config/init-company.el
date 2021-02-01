;; ** edit
;; *** company

(after! company-box
  (setq company-box-max-candidates 20))

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
        '(company-dabbrev company-dabbrev-code company-capf company-files company-yasnippet company-dict company-ispell)
        ;; global 的排除
        company-global-modes '(not comint-mode erc-mode message-mode help-mode gud-mode markdown-mode  gfm-mode org-mode))
  ;; enable global
  (global-company-mode)
  )
(set-company-backend! 'prog-mode
  'company-tabnine
  'company-capf 'company-yasnippet 'company-files 'company-dabbrev 'company-dabbrev-code)
(setq +lsp-company-backend '(company-lsp :with company-tabnine :separate))

;;(setq +lsp-company-backend '(company-lsp))
;;(use-package company-tabnine :ensure t)
;;(add-to-list 'company-backends #'company-tabnine)
(setq company-idle-delay 0)
(setq company-show-numbers t)

(company-childframe-mode 1)
(company-posframe-mode 1)
;;
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

(provide 'init-company)
