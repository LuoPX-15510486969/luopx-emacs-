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
(provide 'init-xah-fly-keys)

