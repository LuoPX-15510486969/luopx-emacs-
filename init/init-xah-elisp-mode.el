
(autoload 'xah-elisp-mode "xah-elisp-mode" "xah emacs lisp major mode." t)

(show-paren-mode t)

;; highlight entire expression
;; (setq show-paren-style 'expression)
;; highlight brackets
(setq show-paren-style 'parenthesis)

(provide 'init-xah-elisp-mode)
