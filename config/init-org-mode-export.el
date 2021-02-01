;;; config/init-org-mode-export.el -*- lexical-binding: t; -*-

(add-hook 'org-mode-hook
          (lambda () (setq truncate-lines nil)))

;; 使用xelatex一步生成PDF
(setq org-latex-to-pdf-process
      '("xelatex -interaction -shell-escape nonstopmode %f"
        "xelatex -interaction -shell-escape nonstopmode %f"))
;; code执行免应答（Eval code without confirm）
(setq org-confirm-babel-evaluate nil)
;; Auctex
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)


(defun org-mode-article-modes ()
  (reftex-mode t)
  (and (buffer-file-name)
       (file-exists-p (buffer-file-name))
       (reftex-parse-all)))
(add-hook 'org-mode-hook
          (lambda ()
            (if (member "REFTEX" org-todo-keywords-1)
                (org-mode-article-modes))))
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))



(with-eval-after-load 'org
  (org-babel-do-load-languages 'org-babel-load-languages
                               '((dot . t)
                                 (maxima . t)
                                 (python . t)))
  (setq org-babel-python-command "python3"))
(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
               '("elegantbook"
                 "\\documentclass[lang=cn,11pt, chinese,titlestyle=hang,mode=fancy,base=show]{elegantbook}



\\extrainfo{Victory won\\rq t come to us unless we go to it. --- M. Moore}

\\logo{logo}
\\cover{cover}

\\usepackage[T1]{fontenc}
\\usepackage[no-math]{fontspec}
\\usepackage[default]{sourcecodepro}
\\usepackage{tabularx}
\\usepackage{longtable}
\\usepackage{titletoc}
\\usepackage{ctex}
\\usepackage[utf8]{inputenc}
\\usepackage{listings}
\\setmainfont{Courier New}
\\usepackage{booktabs}
\\usepackage{minted}
\\newminted{cpp}{frame=single,linenos,breaklines}
\\newminted{java}{frame=single,linenos,,breaklines}
\\newminted{shell}{frame=single,linenos,breaklines}
\\newminted{ruby}{frame=single,linenos,breaklines}
\\newminted{typescript}{frame=single,linenos,breaklines}
\\newminted{js}{frame=single,linenos,breaklines}
\\newminted{sql}{frame=single,linenos,breaklines}
\\newminted{common-lisp}{frame=single,linenos,breaklines}
\\newminted{lisp}{frame=single,linenos,breaklines}
\\newminted{yaml}{frame=single,linenos,breaklines}
\\newminted{xml}{frame=single,linenos,breaklines}
\\newminted{tex}{frame=single,linenos,breaklines}
\\newminted{rust}{frame=single,linenos,breaklines}
\\newminted{python}{frame=single,linenos,breaklines}
\\newminted{html}{frame=single,linenos,breaklines}
\\newminted{groovy}{frame=single,linenos,breaklines}
\\newminted{go}{frame=single,linenos,breaklines}
\\newminted{c++}{frame=single,linenos,breaklines}
\\newminted{cmake}{frame=single,linenos,breaklines}
\\newminted{make}{frame=single,linenos,breaklines}
\\newminted{abap}{frame=single,linenos,breaklines}

%如果没有它，会有一些 tex 特殊字符无法正常使用，比如连字符。
\\defaultfontfeatures{Mapping=tex-text}

% 中文断行
\\XeTeXlinebreaklocale \"zh\"
\\XeTeXlinebreakskip = 0pt plus 1pt minus 0.1pt

[NO-DEFAULT-PACKAGES]
[NO-PACKAGES]

\\pagestyle{fancy}


\\fancyhf{}
\\renewcommand{\\headrulewidth}{0.1pt}
\\renewcommand{\\footrulewidth}{0.1pt}
\\fancyfoot[c]{\\color{structurecolor}\\scriptsize\\thepage}
\\if@twoside
  \\fancyhead[ER]{\\color{structurecolor}\\cnormal\\leftmark}
  \\fancyhead[OL]{\\color{structurecolor}\\cnormal\\rightmark}
\\else
  \\fancyhead[R]{\\color{structurecolor}\\cnormal\\rightmark}
\\fi


\\mainmatter

"
                 ("\\chapter{%s}" . "\\chapter*{%s}")
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
               )
  ;; 导出Beamer的设置
  ;; allow for export=>beamer by placing #+LaTeX_CLASS: beamer in org files
  ;;-----------------------------------------------------------------------------
  (add-to-list 'org-export-latex-classes
               ;; beamer class, for presentations
               '("beamer"
                 "\\documentclass[11pt,professionalfonts]{beamer}
\\mode
\\usetheme{{{{Warsaw}}}}
%\\usecolortheme{{{{beamercolortheme}}}}

\\beamertemplateballitem
\\setbeameroption{show notes}
\\usepackage{graphicx}
\\usepackage{tikz}
\\usepackage{xcolor}
\\usepackage{titletoc}
\\usepackage{ctex}
\\usepackage{xeCJK}
\\usepackage{amsmath}
\\usepackage{lmodern}
\\usepackage{fontspec,xunicode,xltxtra}
\\usepackage{polyglossia}
\\setmainfont{Times New Roman}
\\setCJKmainfont{DejaVu Sans YuanTi}
\\setCJKmonofont{DejaVu Sans YuanTi Mono}
\\usepackage{verbatim}
\\usepackage{listings}
\\institute{{{{beamerinstitute}}}}
\\subject{{{{beamersubject}}}}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\begin{frame}[fragile]\\frametitle{%s}"
                  "\\end{frame}"
                  "\\begin{frame}[fragile]\\frametitle{%s}"
                  "\\end{frame}")))


  ;; Settings to export code with `minted' instead of `verbatim'.
  (setq org-export-latex-listings t)
  (setq org-latex-listings 'minted
        org-latex-packages-alist '(("" "minted"))
        ))
(setq org-latex-custom-lang-environments
      '(
        (C "cppcode")
        (java "javacode")
        (emacs-lisp "lispcode")
        (shell "shellcode")
        (ruby "rubycode")
        (js "jscode")
        (typescript "typescriptcode")
        (js "jscode")
        (sql "sqlcode")
        (yaml "yamlcode")
        (xml "xmlcode")
        (tex "texcode")
        (rust "rustcode")
        (python "pythoncode")
        (html "htmlcode")
        (groovy "groovycode")
        (go "gocode")
        (c++ "cppcode")
        (cmake "cmakecode")
        (make "makecode")
        (abap "abapcode")
        ))

;; 各种Babel语言支持
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (emacs-lisp . t)
   (matlab . t)
   (C . t)
   (perl . t)
   (sh . t)
   (ditaa . t)
   (python . t)
   (haskell . t)
   (dot . t)
   (latex . t)
   (js . t)
   (java . t)
   (shell . t)
   ))

;; 导出Beamer的设置
;; allow for export=>beamer by placing #+LaTeX_CLASS: beamer in org files
;;-----------------------------------------------------------------------------
(setq org-export-with-sub-superscripts nil)

(setq ps-paper-type 'a4
      ps-font-size 16.0
      ps-print-header nil
      ps-landscape-mode nil)
(provide 'init-org-mode-export)
