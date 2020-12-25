(setq-default lsp-java-server-install-dir "~/jdt-language-server-0.64.0-202011031853.tar")
;;(require 'java-imports)
;; whatever you want to bind it to
;;(define-key! java-mode-map (kbd "M-I") 'java-imports-add-import-dwim)

;; See customization below for where to put java imports
;;(setq java-imports-find-block-function 'java-imports-find-place-sorted-block)
;;(add-hook 'java-mode-hook 'java-imports-scan-file)
;; to enable the lenses
;;(add-hook 'lsp-mode-hook #'lsp-lens-mode)
;;(add-hook 'java-mode-hook #'lsp-java-boot-lens-mode)
(provide 'init-java)
