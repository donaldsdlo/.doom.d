;;; config/init-keybindings.el -*- lexical-binding: t; -*-


(map! :leader "z a" #'lsp-ui-sideline-apply-code-actions)

(map! :leader "z s" #'my-org-screenshot)

(map! :leader "z t" #'youdao-dictionary-search-at-point-posframe)

(map! :leader "z p" #'paste-image-from-clipboard)

(provide 'init-keybindings)
