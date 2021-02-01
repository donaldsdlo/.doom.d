;;; config/init-cpp.el -*- lexical-binding: t; -*-
(setq ccls-executable "/usr/local/Cellar/ccls/0.20201219/bin/ccls")
(after! ccls
  (setq ccls-initialization-options '(
                                      :clang (
                                              :extraArgs ["-isystem/usr/local/opt/llvm/bin/../include/c++/v1"
                                                          "-isystem/usr/local/Cellar/llvm/11.0.0/lib/clang/11.0.0/include"
                                                          "-isystem/usr/local/opt/llvm/bin/../include/c++/v1"
                                                          "-isystem/usr/local/Cellar/llvm/10.0.0_3/lib/clang/10.0.0/include"
                                                          "-isystem/Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/include"
                                                          "-isystem/Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/System/Library/Frameworks"
                                                          "-isystem/usr/local/include"
                                                          "-isystem/usr/local/Cellar/spdlog/1.8.2/include"
                                                          "-fallow-editor-placeholders"
                                                          ]
                                              :resourceDir "/usr/local/Cellar/llvm/11.0.0/lib/clang/11.0.0"
                                              )

                                      ))
  )

(provide 'init-cpp)
