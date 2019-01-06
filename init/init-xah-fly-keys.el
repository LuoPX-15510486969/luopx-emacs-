(setq xah-fly-use-control-key nil)
(require 'xah-fly-keys)
(xah-fly-keys-set-layout "qwerty") ; required if you use qwerty

;; possible layout values:
;; "qwerty"
;; "qwerty-abnt"
;; "qwertz"
;; "dvorak"
;; "programer-dvorak"
;; "colemak"
;; "colemak-mod-dh"
;; "workman"

;; dvorak is the default

;; automatic save buffer when switching to command mode
;;(add-hook 'xah-fly-command-mode-activate-hook 'basic-save-buffer)
;; remove a hook
;;(remove-hook 'xah-fly-command-mode-activate-hook 'xah-fly-save-buffer-if-file)

(define-key key-translation-map (kbd "ESC") (kbd "C-g")) 
(xah-fly-keys 1)

;; ;; thing-edit shortcut
;; (xah-fly--define-keys
;;  ;; create a keymap my-keymap
;;  (define-prefix-command 'thing-copy-keymap)
;;  '(
;;    ("w" . thing-copy-word)
;;    ;;
;;    ))

;; ;; make xah-fly-keys 【leader 8】 as prefix for my-keymap
;; (xah-fly--define-keys
;;  (define-prefix-command 'xah-fly-leader-key-map)
;;  '(
;;    ("c" . thing-copy-keymap)
;;    ;;
;;    ))

;; all letters are dvorak. They get translated to whatever your xah-fly-keys-set-layout is set to

(provide 'init-xah-fly-keys)

