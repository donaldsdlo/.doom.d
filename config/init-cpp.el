;;; config/init-cpp.el -*- lexical-binding: t; -*-
(setq ccls-executable "/usr/local/Cellar/ccls/0.20201219/bin/ccls")
(setq flycheck-check-syntax-automatically '(save mode-enabled))
(setq flycheck-clang-language-standard "c++2a")
(setq lsp-obey-flycheck t)
;;遍历projectile 根目录下的所有文件夹，找到include的文件夹，并将文件夹添加
;;到extraArgs参数中，但是护领donald-ccls-include-ignore-dirs中的文件夹
(setq donald-ccls-include-ignore-dirs '(
                                        ".idea"
                                        ".git"
                                        "cmak-build-debug"
                                        "build"
                                        ))
(setq donald-ccls-initialization-options-clang-extraArgs '(
                                                           "-isystem/usr/local/opt/llvm/bin/../include/c++/v1"
                                                           "-isystem/usr/local/Cellar/llvm/11.0.0/lib/clang/11.0.0/include"
                                                           "-isystem/usr/local/opt/llvm/bin/../include/c++/v1"
                                                           "-isystem/usr/local/Cellar/llvm/10.0.0_3/lib/clang/10.0.0/include"
                                                           "-isystem/Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/include"
                                                           "-isystem/Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/System/Library/Frameworks"
                                                           "-isystem/usr/local/include"
                                                           "-isystem/usr/local/Cellar/spdlog/1.8.2/include"
                                                           "-fallow-editor-placeholders"
                                                           ))
(after! ccls
  (setq donald-ccls-include-directory
        (seq-filter
         (lambda (path)
           (not (seq-some (lambda (x) (string-match x path))
                          donald-ccls-include-ignore-dirs
                          ))

           )
         (directory-files-recursively (projectile-project-root) "include$" t)

         )
        )

  (dolist (ele donald-ccls-include-directory)
           (add-to-list 'donald-ccls-initialization-options-clang-extraArgs (concat "-I" ele))
           )
  ;;加载自定义的include path,此文件放在project的根目录中
  ;; (setf donald-include-directory (concat (projectile-project-root) ".include-path"))

  (if (file-exists-p (concat (projectile-project-root) ".include-path"))
      (progn
        (message (concat (projectile-project-root) ".include-path"))
        (dolist (ele (load-config-to-list (concat (projectile-project-root) ".include-path")))
          (message ele)
          (add-to-list 'donald-ccls-initialization-options-clang-extraArgs (concat "-I" ele))
           )
        )


      )
  (setq donald-clang ())
  (add-to-list 'donald-clang (seq--into-vector donald-ccls-initialization-options-clang-extraArgs))
  (add-to-list 'donald-clang :extraArgs)

  (add-to-list 'donald-clang "/usr/local/Cellar/llvm/11.0.0/lib/clang/11.0.0")
  (add-to-list 'donald-clang :resourceDir)
  ;; (setq ccls-initialization-options '(

  ;;                                     :clang
  ;;                                     donald-clang
  ;;                                     ;; (
  ;;                                     ;;         :extraArgs 'l;;(seq--into-vector donald-ccls-initialization-options-clang-extraArgs)

  ;;                                     ;;         :resourceDir "/usr/local/Cellar/llvm/11.0.0/lib/clang/11.0.0"
  ;;                                             ;; )

  ;;                                     ))
  (setq ccls-initialization-options ())
  (add-to-list 'ccls-initialization-options donald-clang)
  (add-to-list 'ccls-initialization-options :clang)
  (message (projectile-project-root))

  )

(provide 'init-cpp)
