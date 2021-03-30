;;; config/init-projectile.el -*- lexical-binding: t; -*-
(setq projectile-completion-system 'ivy)
;; (setq projectile-globally-ignored-file-suffixes '(
;;                                                   ".pdf"
;;                                                   ".aux"
;;                                                   ".toc"
;;                                                   ".out"
;;                                                   ))

;; (setq projectile-globally-ignored-directories '(
;;                                                 "build"
;;                                                 ".ccls-cache"
;;                                                 ".emacs.d"
;;                                                 ".local"
;;                                                 ".idea"
;;                                                 ".vscode"
;;                                                 ".ensime_cache"
;;                                                 ".eunit"
;;                                                 ".git"
;;                                                 ".hg"
;;                                                 ".fslckout"
;;                                                 "_FOSSIL_"
;;                                                 ".bzr"
;;                                                 "_darcs"
;;                                                 ".tox"
;;                                                 ".svn"
;;                                                 ".stack-work"
;;                                                 ".ccls-cache"
;;                                                 ".clangd")
;;                                                )
;;load ignored directory from config file
;; (load-config-to-list "~/.doom.d/config/projectile/projectile-globally-ignored-directories"
;;                      projectile-globally-ignored-directories)
(setq projectile-globally-ignored-directories 
  (load-config-to-list "~/.doom.d/config/projectile/projectile-globally-ignored-directories"))
;;load ignored file suffixe from config file
;;(load-config-to-list "~/.doom.d/config/projectile/projectile-globally-ignored-file-suffixes"
;;                     projectile-globally-ignored-file-suffixes
;;                     )
(setq projectile-globally-ignored-file-suffixes 
  (load-config-to-list "~/.doom.d/config/projectile/projectile-globally-ignored-file-suffixes"))
(provide 'init-projectile)
