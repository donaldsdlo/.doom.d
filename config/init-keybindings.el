;;; config/init-keybindings.el -*- lexical-binding: t; -*-


(map! :leader "z a" #'lsp-ui-sideline-apply-code-actions)

(provide 'init-keybindings)
