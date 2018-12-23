(require 'dired)
(require 'dired-hacks-utils)
(require 'dired-filter)
(require 'dired-narrow)
(require 'dired-avfs)
(require 'dired-open)
(require 'dired-ranger)
(require 'dired-rainbow)
(require 'dired-subtree)
;;(require 'dired-list)
(require 'dired-collapse)
(require 'dired-k)
;;(require 'all-the-icons-dired)

;; funcs.el file for luo-dired contribution layer

(defun luo-dired/dotfiles-toggle ()
  "Show/hide dot-files"
  (interactive)
  (when (equal major-mode 'dired-mode)
    (if (or (not (boundp 'dired-dotfiles-show-p)) dired-dotfiles-show-p) ; if currently showing
        (progn
          (set (make-local-variable 'dired-dotfiles-show-p) nil)
          (message "h")
          (dired-mark-files-regexp "^\\\.")
          (dired-do-kill-lines))
      (progn (revert-buffer) ; otherwise just revert to re-show
             (set (make-local-variable 'dired-dotfiles-show-p) t)))))

(defun luo-dired/back-to-top ()
  "Move to first file"
  (interactive)
  (beginning-of-buffer)
  (dired-next-line 1))

(defun luo-dired/jump-to-bottom ()
  "Move to last file"
  (interactive)
  (end-of-buffer)
  (dired-next-line -1))

(defun luo-dired/move-up ()
  "Move to previous file"
  (interactive)
  (dired-previous-line 1)
  (if (bobp)
      (dired-next-line 1)))

(defun luo-dired/move-down ()
  "Move to next file"
  (interactive)
  (dired-next-line 1)
  (if (eobp)
      (dired-next-line -1)))

(defun luo-dired/up-directory (&optional other-window)
  "Run Dired on parent directory of current directory."
  (interactive "P")
  (let* ((dir (dired-current-directory))
         (orig (current-buffer))
         (up (file-name-directory (directory-file-name dir))))
    (or (dired-goto-file (directory-file-name dir))
        ;; Only try dired-goto-subdir if buffer has more than one dir.
        (and (cdr dired-subdir-alist)
             (dired-goto-subdir up))
        (progn
          (kill-buffer orig)
          (dired up)
          (dired-goto-file dir)))))

(defun luo-dired/dired-diff ()
  "Ediff marked files in dired or selected files in separate window"
  (interactive)
  (let* ((marked-files (dired-get-marked-files nil nil))
        (other-win (get-window-with-predicate
                    (lambda (window)
                      (with-current-buffer (window-buffer window)
                        (and (not (eq window (selected-window)))
                             (eq major-mode 'dired-mode))))))
        (other-marked-files (and other-win
                                 (with-current-buffer (window-buffer other-win)
                                   (dired-get-marked-files nil)))))
    (cond ((= (length marked-files) 2)
           (ediff-files (nth 0 marked-files)
                        (nth 1 marked-files)))
          ((= (length marked-files) 3)
           (ediff-files3 (nth 0 marked-files)
                         (nth 1 marked-files)
                         (nth 2 marked-files)
                         ))
          ((and (= (length marked-files) 1)
                (= (length other-marked-files) 1))
           (ediff-files (nth 0 marked-files)
                        (nth 0 other-marked-files)))
          ((= (length marked-files) 1)
           (dired-diff))
          (t (error "mark exactly 2 files, at least 1 locally")))))


(defun luo-dired/dired-setup ()
  "Setup custom dired settings for luo-dired"
  (setq dired-omit-verbose nil)
  (make-local-variable 'dired-hide-symlink-targets)
  (setq dired-hide-details-hide-symlink-targets nil)

  ;; hide details by default
  (dired-hide-details-mode t)
  ;; omit the .. in dired
  (dired-omit-mode t)

  ;; allow selection with mouse
  (make-local-variable 'mouse-1-click-follows-link)
  (setq mouse-1-click-follows-link nil)

  (local-set-key (kbd  "<mouse-1>") 'luo-dired/dired-mouse-click)
  (local-set-key (kbd  "<mouse-3>") 'luo-dired/up-directory)
  (local-set-key (kbd  "<down-mouse-3>") nil)
  )

(defun luo-dired/dired-mouse-click (event)
  "In Dired, visit the file or directory name you click on."
  (interactive "e")
  (let (window pos file)
    (save-excursion
      (setq window (posn-window (event-end event))
            pos (posn-point (event-end event)))
      (if (not (windowp window))
          (error "No file chosen"))
      (set-buffer (window-buffer window))
      (goto-char pos)
      (setq file (dired-get-file-for-visit)))
    (find-alternate-file file)))

(defun luo-dired/dired-mouse-click-3 (event)
  "In Dired, show context menu or go up a directory."
  (interactive "e")
  (let (window pos file)
    (save-excursion
      (setq window (posn-window (event-end event))
            pos (posn-point (event-end event)))
      (if (not (windowp window))
          (error "No file chosen"))
      (set-buffer (window-buffer window))
      (goto-char pos)
      (condition-case-unless-debug ex
          (progn
            (setq file (dired-get-file-for-visit))
            (dired-find-file-other-window))
        ('error
         (luo-dired/up-directory)
         ))
    )))


;; Make a Key do x Depending on Major Mode
(defun my-move-up-wrapper ()
  "call different commands depending on what's current major mode."
  (interactive)
  (cond
   ((string-equal major-mode "dired-mode") (luo-dired/move-up))
 ;;  ((string-equal major-mode "x2-mode") (x2-cmd))
   ;; more major-mode checking here

   ;; if nothing match, do nothing
   (t nil)))

;; ;;Add or Change Command Mode Keys
;; (defun my-bindkey-xfk-insert-mode ()
;;   "Define keys for `xah-fly-insert-mode-activate-hook'"
;;   (interactive)
;;   (define-key xah-fly-key-map (kbd "DEL") 'xah-fly-command-mode-activate)
;;   ;; more here
;;   )

(defun my-bindkey-xfk-command-mode ()
  "Define keys for `xah-fly-command-mode-activate-hook'"
  (interactive)
  (define-key xah-fly-key-map (kbd "h") 'my-move-up-wrapper)
  ;; more here
  )

;;(add-hook 'xah-fly-insert-mode-activate-hook 'my-bindkey-xfk-insert-mode)
;; (add-hook 'xah-fly-command-mode-activate-hook 'my-bindkey-xfk-command-mode)

(lazy-set-key
 '(
   ("k" . luo-dired/move-down)            ;下一个子目录
   ("i" . luo-dired/move-up)            ;上一个子目录
   ("j" . luo-dired/up-directory)           ;下一个目录
   ("c" . dired-ranger-copy)           ;上一个目录
   ("v" . dired-ranger-paste)          
   ("x" . dired-ranger-move)     
   ("b" . dired-ranger-bookmark) 
   ("f" . dired-ranger-bookmark-visit) 
   ("a" . dired-back-to-start-of-files)
   ("n" . dired-next-subdir)        
   ("p" . dired-prev-subdir) ;
   ("t" . luo-dired/dotfiles-toggle)
   ("0" . luo-dired/back-to-top)    

   )
 dired-mode-map
 )
(provide 'init-dired)
