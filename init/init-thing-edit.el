;;; init-thing-edit.el --- Thing edit

;; Filename: init-thing-edit.el
;; Description: Thing edit
;; Author: Andy Stewart <andy@freedom>
;; Maintainer: Andy Stewart <andy@freedom>
;; Copyright (C) 2013, Andy Stewart, all rights reserved.
;; Created: 2013-12-28 07:46:40
;; Version: 0.1
;; Last-Updated: 2013-12-28 07:46:40
;;           By: Andy Stewart
;; URL: http://www.emacswiki.org/emacs/download/init-thing-edit.el
;; Keywords:
;; Compatibility: GNU Emacs 24.3.50.1
;;
;; Features that might be required by this library:
;;
;;
;;

;;; This file is NOT part of GNU Emacs

;;; License
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.

;;; Commentary:
;;
;; Thing edit
;;

;;; Installation:
;;
;; Put init-thing-edit.el to your load-path.
;; The load-path is usually ~/elisp/.
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; And the following to your ~/.emacs startup file.
;;
;; (require 'init-thing-edit)
;;
;; No need more.

;;; Customize:
;;
;;
;;
;; All of the above can customize by:
;;      M-x customize-group RET init-thing-edit RET
;;

;;; Change log:
;;
;; 2013/12/28
;;      * First released.
;;

;;; Acknowledgements:
;;
;;
;;

;;; TODO
;;
;;
;;

;;; Require

(require 'one-key)
(require 'thing-edit)

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Thing-Edit ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar one-key-menu-copy-thing-edit-alist nil
  "The `one-key' menu alist for COPY-THING-EDIT.")

(defvar one-key-menu-cut-thing-edit-alist nil
  "The `one-key' menu alist for CUT-THING-EDIT.")

(defvar one-key-menu-replace-thing-edit-alist nil
  "The `one-key' menu alist for REPLACE-THING-EDIT.")



(setq one-key-menu-copy-thing-edit-alist
      '(
        ;; Copy.
        (("w" . "Copy Word") . thing-copy-word)
        (("s" . "Copy Symbol") . thing-copy-symbol)
        (("m" . "Copy Email") . thing-copy-email)
        (("f" . "Copy Filename") . thing-copy-filename)
        (("u" . "Copy URL") . thing-copy-url)
        (("x" . "Copy Sexp") . thing-copy-sexp)
        (("g" . "Copy Page") . thing-copy-page)
        (("t" . "Copy Sentence") . thing-copy-sentence)
        (("o" . "Copy Whitespace") . thing-copy-whitespace)
        (("i" . "Copy List") . thing-copy-list)
        (("c" . "Copy Comment") . thing-copy-comment)
        (("h" . "Copy Function") . thing-copy-defun)
        (("p" . "Copy Parentheses") . thing-copy-parentheses)
        (("l" . "Copy Line") . thing-copy-line)
        (("a" . "Copy To Line Begin") . thing-copy-to-line-beginning)
        (("e" . "Copy To Line End") . thing-copy-to-line-end)
        ))

(setq one-key-menu-replace-thing-edit-alist
      '(
        ;; Replace. 
        (("w" . "Replace Word") . thing-replace-word)
        (("s" . "Replace Symbol") . thing-replace-symbol)
        (("m" . "Replace Email") . thing-replace-email)
        (("f" . "Replace Filename") . thing-replace-filename)
        (("u" . "Replace URL") . thing-replace-url)
        (("x" . "Replace Sexp") . thing-replace-sexp)
        (("g" . "Replace Page") . thing-replace-page)
        (("t" . "Replace Sentence") . thing-replace-sentence)
        (("o" . "Replace Whitespace") . thing-replace-whitespace)
        (("i" . "Replace List") . thing-replace-list)
        (("c" . "Replace Comment") . thing-replace-comment)
        (("h" . "Replace Function") . thing-replace-defun)
        (("p" . "Replace Parentheses") . thing-replace-parentheses)
        (("l" . "Replace Line") . thing-replace-line)
        (("a" . "Replace To Line Begin") . thing-replace-to-line-beginning)
        (("e" . "Replace To Line End") . thing-replace-to-line-end)
        ))

(setq one-key-menu-cut-thing-edit-alist
      '(
        ;; Cut.
        (("w" . "Cut Word") . thing-cut-word)
        (("s" . "Cut Symbol") . thing-cut-symbol)
        (("m" . "Cut Email") . thing-cut-email)
        (("f" . "Cut Filename") . thing-cut-filename)
        (("u" . "Cut URL") . thing-cut-url)
        (("x" . "Cut Sexp") . thing-cut-sexp)
        (("g" . "Cut Page") . thing-cut-page)
        (("t" . "Cut Sentence") . thing-cut-sentence)
        (("o" . "Cut Whitespace") . thing-cut-whitespace)
        (("i" . "Cut List") . thing-cut-list)
        (("c" . "Cut Comment") . thing-cut-comment)
        (("h" . "Cut Function") . thing-cut-defun)
        (("p" . "Cut Parentheses") . thing-cut-parentheses)
        (("l" . "Cut Line") . thing-cut-line)
        (("a" . "Cut To Line Begin") . thing-cut-to-line-beginning)
        (("e" . "Cut To Line End") . thing-cut-to-line-end)
        ))



(defun one-key-menu-copy-thing-edit ()
  "The `one-key' menu for THING-EDIT."
  (interactive)
  (one-key-menu "COPY-THING-EDIT" one-key-menu-copy-thing-edit-alist t))

(defun one-key-menu-cut-thing-edit ()
  "The `one-key' menu for THING-EDIT."
  (interactive)
  (one-key-menu "CUT-THING-EDIT" one-key-menu-cut-thing-edit-alist t))

(defun one-key-menu-replace-thing-edit ()
  "The `one-key' menu for THING-EDIT."
  (interactive)
  (one-key-menu "REPLACE-THING-EDIT" one-key-menu-replace-thing-edit-alist t))

(lazy-set-key '(("<f2>" . one-key-menu-copy-thing-edit)))

(lazy-set-key '(("<f3>" . one-key-menu-cut-thing-edit)))

(lazy-set-key '(("<f4>" . one-key-menu-replace-thing-edit)))

(provide 'init-thing-edit)

;;; init-thing-edit.el ends here
