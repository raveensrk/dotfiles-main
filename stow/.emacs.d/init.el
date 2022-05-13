(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(tango-dark))
 '(custom-safe-themes
   '("ee92ce1c1161c93411629213e2e51ff0199aedc479c4588f3bdf8747e3dc1ae6" default))
 '(org-agenda-files '("./"))
 '(org-export-backends '(ascii html icalendar latex md odt))
 '(org-habit-show-all-today t)
 '(org-habit-show-done-always-green nil)
 '(org-log-into-drawer t)
 '(org-modules
   '(ol-bbdb ol-bibtex ol-docview ol-doi ol-eww ol-gnus org-habit ol-info ol-irc ol-mhe org-mouse ol-rmail ol-w3m))
 '(package-selected-packages
   '(ledger-mode minimal-session-saver persistent-scratch load-dir flycheck-grammarly flycheck grammarly company languagetool magit doom 2048-game writegood-mode search-web restart-emacs git-gutter flyspell-correct evil-vimish-fold evil-goggles beacon ## evil-vimish-fold evil-goggles folding git-gutter org-mind-map noccur consult-dir consult org-roam multiple-cursors mark-multiple elfeed-org elfeed evil expand-region org-superstar magit))
 '(show-paren-mode t)
 '(tab-width 4)
 '(verilog-indent-level 4)
 '(word-wrap t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#242424" :foreground "#f6f3e8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 200 :width normal :foundry "nil" :family "monospace")))))
(setq inhibit-startup-screen t)
(setq ring-bell-function 'ignore)
(setq visible-bell 1)
(setq dired-kill-when-opening-new-dired-buffer t)

;; Better copy and cut
;; (defadvice kill-ring-save (before slick-copy activate compile) "When called
;;   interactively with no active region, copy a single line instead."
;;            (interactive (if mark-active (list (region-beginning) (region-end)) (message
;; 	                                "Copied line") (list (line-beginning-position) (line-beginning-position
;; 		                                2)))))
;; (defadvice kill-region (before slick-cut activate compile)
;;   "When called interactively with no active region, kill a single line instead."
;;   (interactive
;;    (if mark-active (list (region-beginning) (region-end))
;;      (list (line-beginning-position)
;;            (line-beginning-position 2)))))

;; Org mode
(setq org-src-tab-acts-natively t)
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(setq org-agenda-files '("./"))
(global-set-key (kbd "C-c c") #'org-capture)
(org-babel-do-load-languages 'org-babel-load-languages 
                             '(
                               (shell . t)
                               )
                             )
(global-set-key (kbd "C-c e") 'org-babel-execute-src-block)
(setq org-confirm-babel-evaluate nil)
;; (org-num-mode)

;; Interface
(global-set-key (kbd "ESC m") #'menu-bar-open)
(put 'narrow-to-region 'disabled nil)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") the)

;; (package-initialize)
;; (package-refresh-contents)

(when (require 'beacon nil 'noerror)
  (beacon-mode 1))

(add-hook 'find-file-hook
          (lambda ()
            (when (string= (file-name-extension buffer-file-name) "org")
              (org-indent-mode +1))))

;; Magit
(when (require 'magit nil 'noerror)
  (global-set-key (kbd "C-x g") 'magit-status))

(set-face-attribute 'default nil :height 100)

;; IDO Mode
;; (ido-mode 1)

;; (org-superstar-mode 1)

(when (require 'expand-region nil 'noerror)
  (global-set-key (kbd "C-=") 'er/expand-region))

;; (require 'evil)
;; (evil-mode 1)
;; (global-evil-surround-mode 1)
;; 
;; ;; this macro was copied from here: https://stackoverflow.com/a/22418983/4921402
;; (defmacro define-and-bind-quoted-text-object (name key start-regex end-regex)
;;   (let ((inner-name (make-symbol (concat "evil-inner-" name)))
;;         (outer-name (make-symbol (concat "evil-a-" name))))
;;     `(progn
;;        (evil-define-text-object ,inner-name (count &optional beg end type)
;;          (evil-select-paren ,start-regex ,end-regex beg end type count nil))
;;        (evil-define-text-object ,outer-name (count &optional beg end type)
;;          (evil-select-paren ,start-regex ,end-regex beg end type count t))
;;        (define-key evil-inner-text-objects-map ,key #',inner-name)
;;        (define-key evil-outer-text-objects-map ,key #',outer-name))))
;; 
;; 
;; (define-and-bind-quoted-text-object "tilde" "~" "~" "~")

;; Also, hiding leading stars with ~(setq org-superstar-special-todo-items 'hide)~ looks great but breaks after switching org-mode buffers once.

(tab-bar-mode 1)
(savehist-mode 1)
(mouse-avoidance-mode 'cat-and-mouse)

;; This will set first buffer shown as scratch
;; (setq initial-buffer-choice t)

;; https://stackoverflow.com/questions/1817257/how-to-determine-operating-system-in-elisp
(defmacro with-system (type &rest body)
  "Evaluate BODY if `system-type' equals TYPE."
  (declare (indent defun))
  `(when (eq system-type ',type)
     ,@body))

(with-system gnu/linux
  ;; This will add this file to buffer list when opening emacs
  ;; TODO file-exists-p
  ;; (find-file "~/repos/dotfiles-main/dotfiles/.emacs")
  )

(with-system windows-nt
  ;; (find-file "c:/Github/dotfiles-main/dotfiles/.emacs")
  )

;; https://stackoverflow.com/questions/6515009/how-to-configure-emacs-to-have-it-complete-the-path-automatically-like-vim#6556788

(when (require 'multiple-cursors nil 'noerror)
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

;; set default tab char's display width to 4 spaces
(setq-default tab-width 4) ; emacs 23.1 to 26 default to 8

;; set current buffer's tab char's display width to 4 spaces
(setq tab-width 4)

(progn
  ;; make indent commands use space only (never tab character)
  (setq-default indent-tabs-mode nil)
  ;; emacs 23.1 to 26, default to t
  ;; if indent-tabs-mode is t, it means it may use tab, resulting mixed space and tab
  )

;; Modes
(add-to-list 'auto-mode-alist '("\\.bash_aliases$" . shell-script-mode))

(defun my-org-screenshot ()
  "Take a screenshot into a time stamped unique-named file in the
same directory as the org-buffer and insert a link to this file."
  (interactive)
  (setq filename
        (concat
         (make-temp-name
          (concat (buffer-file-name)
                  "_"
                  (format-time-string "%Y%m%d_%H%M%S_")) ) ".png"))
  (call-process "import" nil nil nil filename)
  (insert (concat "[[" filename "]]"))
  (org-display-inline-images))

;; (setq org-startup-folded t)
(setq-default abbrev-mode 1)
;; (evil-mode 1)
(set-face-attribute 'default nil :height 200)

(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "DELEGATED" "SKIPPED")))

;; Git gutter mode
(when (require 'git-gutter nil 'noerror)
  (require 'git-gutter)
  ;; If you enable global minor mode
  (global-git-gutter-mode t)
  ;; If you would like to use git-gutter.el and linum-mode
  (git-gutter:linum-setup)
  ;; If you enable git-gutter-mode for some modes
  (add-hook 'ruby-mode-hook 'git-gutter-mode)
  (global-set-key (kbd "C-x C-g") 'git-gutter)
  (global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)

  ;; Jump to next/previous hunk
  (global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
  (global-set-key (kbd "C-x n") 'git-gutter:next-hunk)

  ;; Stage current hunk
  (global-set-key (kbd "C-x v s") 'git-gutter:stage-hunk)

  ;; Revert current hunk
  (global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)

  ;; Mark current hunk
  (global-set-key (kbd "C-x v SPC") #'git-gutter:mark-hunk)
  )


(defun dired-dotfiles-toggle ()
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

;; Download Evil
;; (unless (package-installed-p 'evil)
;;   (package-install 'evil))

(when (package-installed-p 'evil)
  (require 'evil)
  (evil-mode 1)
  (evil-goggles-mode 1)
  (evil-vimish-fold-mode 1)
  )

(when (package-installed-p 'company)
  (require 'company)
  (global-company-mode 1)
)

;; https://emacsredux.com/blog/2021/12/22/check-if-a-font-is-available-with-emacs-lisp/

(cond
 ((find-font (font-spec :name "Cascadia Code"))
  (set-frame-font "Cascadia Code-12"))
 ((find-font (font-spec :name "Menlo"))
  (set-frame-font "Menlo-12"))
 ((find-font (font-spec :name "DejaVu Sans Mono"))
  (set-frame-font "DejaVu Sans Mono-12"))
 ((find-font (font-spec :name "Inconsolata"))
  (set-frame-font "Inconsolata-12")))

;; This will enable spell checker
;; https://www.tenderisthebyte.com/blog/2019/06/09/spell-checking-emacs/

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

(eval-after-load "flyspell"
  '(progn
     (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
     (define-key flyspell-mouse-map [mouse-3] #'undefined)))

(dolist (hook '(org-mode-hook))
  (add-hook hook (lambda () (visual-line-mode 1))))


(winner-mode 1)
(recentf-mode 1)
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(global-company-mode 1)  

(require 'minimal-session-saver)
(minimal-session-saver-install-aliases)

