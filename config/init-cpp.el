;;; config/init-cpp.el -*- lexical-binding: t; -*-

(after! ccls
  (setq ccls-initialization-options '(
                                      :clang (
                                              :extraArgs ["-isystem/usr/local/opt/llvm/bin/../include/c++/v1"
                                                          "-isystem/usr/local/Cellar/llvm/11.0.0/lib/clang/11.0.0/include"
                                                          "-isystem/usr/local/opt/llvm/bin/../include/c++/v1"
                                                          "-isystem/usr/local/Cellar/llvm/10.0.0_3/lib/clang/10.0.0/include"
                                                          "-isystem/Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/include"
                                                          "-isystem/Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/System/Library/Frameworks"]
                                              :resourceDir "/usr/local/Cellar/llvm/10.0.0_3/lib/clang/10.0.0"
                                              )

                                      ))
  )

(provide 'init-cpp)
