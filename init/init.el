(defun add-subdirs-to-load-path (dir)
  "Recursive add directories to 'load-path'."
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
   (normal-top-level-add-subdirs-to-load-path)))
(add-subdirs-to-load-path "~/luopx-emacs-one-by-one")


(require 'theme)
(require 'init-startup)
(require 'lazy-set-key)
(require 'init-semx)
(require 'init-awesome-tab)
(require 'init-awesome-pair)
(require 'init-awesome-tray)
(require 'init-auto-save)
(require 'init-company-mode)

(require 'init-keys)
