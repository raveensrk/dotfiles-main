;;; open-external.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2022 Raveen Kumar
;;
;; Author: Raveen Kumar <raveen@raveenkumar.xyz>
;; Maintainer: Raveen Kumar <raveen@raveenkumar.xyz>
;; Created: November 28, 2022
;; Modified: November 28, 2022
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex tools unix vc wp
;; Homepage: https://github.com/rkumar/open-external
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:


(defun my-wsl2-open-external-org-https-urls ()
  "This function opens the current url in the default browser outside of wsl 2"
  (interactive)
  (shell-command
   (concat "OpenWith.exe" " "
           (message
            (replace-regexp-in-string
             "\\].*" "" (replace-regexp-in-string
                         ".*\\[\\[" "" (buffer-substring (point-at-bol) (point-at-eol))))))))

   ;; [[https://uhnder.atlassian.net/wiki/spaces/~887729035/pages/3466199702/Daily+Log+-+Main][Daily log main]]


(defun my-wsl2-open-external-current-file ()
  "This function is used to open current file in buffer in external program in WSL 2"
  (interactive)
  (shell-command
   (concat "open "  "'"
           (buffer-file-name (other-buffer)) "'" )))



   (provide 'open-external)
;;; open-external.el ends here
