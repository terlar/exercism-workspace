;;; .dir-locals.el --- Local configuration -*- coding: utf-8; lexical-binding: t; -*-
((nil . ((eval . (setq projectile-project-root
                       (locate-dominating-file buffer-file-name ".dir-locals.el")))
         (compile-command . "jest")))
 (js-mode . ((mode . javascript-format-on-save)
             (flymake-eslint-executable-name . "eslint_d")
             (flymake-eslint-executable-args . "--cache"))))
;;; .dir-locals.el ends here
