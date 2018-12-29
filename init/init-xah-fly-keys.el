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

(xah-fly-keys 1)
(provide 'init-xah-fly-keys)
