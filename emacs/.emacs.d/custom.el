(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(abbrev-suggest t)
 '(ace-window-display-mode t)
 '(after-save-hook '(executable-make-buffer-file-executable-if-script-p))
 '(apropos-compact-layout t)
 '(auto-hscroll-mode 'current-line)
 '(aw-dispatch-always nil)
 '(aw-dispatch-when-more-than 1)
 '(aw-keys '(49 50 51 52 53 54 55 56 57))
 '(beacon-blink-delay 0.7)
 '(beacon-blink-duration 1)
 '(beacon-blink-when-point-moves-horizontally 1)
 '(beacon-blink-when-point-moves-vertically 1)
 '(beacon-color "sienna1")
 '(beacon-dont-blink-commands nil)
 '(blink-cursor-delay 0.2)
 '(blink-cursor-interval 0.2)
 '(blink-cursor-mode nil)
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(bookmark-use-annotations t)
 '(company-async-redisplay-delay 1)
 '(company-idle-delay 2)
 '(company-keywords-ignore-case t)
 '(company-tooltip-idle-delay 1.5)
 '(confirm-kill-emacs 'y-or-n-p)
 '(counsel-describe-function-function 'helpful-callable)
 '(counsel-describe-variable-function 'helpful-variable)
 '(counsel-mode t)
 '(counsel-mode-override-describe-bindings t)
 '(cursor-in-non-selected-windows 'box)
 '(cursor-type 'box)
 '(custom-browse-only-groups nil)
 '(custom-browse-order-groups 'last)
 '(custom-browse-sort-alphabetically t)
 '(custom-buffer-done-kill t)
 '(custom-buffer-sort-alphabetically t)
 '(custom-enabled-themes '(cyberpunk))
 '(custom-magic-show-button nil)
 '(custom-safe-themes
   '("a1c18db2838b593fba371cb2623abd8f7644a7811ac53c6530eebdf8b9a25a8d" default))
 '(custom-unlispify-remove-prefixes t)
 '(cycle-spacing-actions
   '(just-one-space delete-all-space restore delete-space-after delete-space-before))
 '(dashboard-navigator-buttons nil)
 '(dashboard-page-separator "\12\12")
 '(dashboard-projects-backend 'project-el)
 '(dashboard-vertically-center-content t)
 '(default-input-method "rfc1345")
 '(delete-selection-mode t)
 '(dimmer-fraction 0.7)
 '(dired-auto-revert-buffer 'dired-directory-changed-p)
 '(duplicate-line-final-position 1)
 '(dynamic-completion-mode t)
 '(ediff-split-window-function 'split-window-horizontally)
 '(etags-xref-prefer-current-file t)
 '(ffap-file-name-with-spaces t)
 '(focus-follows-mouse t)
 '(global-prettify-symbols-mode t)
 '(global-so-long-mode t)
 '(global-text-scale-adjust-resizes-frames t)
 '(golden-ratio-auto-scale t)
 '(grep-find-command
   '("find -L . -type f -exec grep --color=auto -nH --null -e  \\{\\} +" . 54))
 '(grep-find-ignored-files
   '(".#*" "*.o" "*~" "*.bin" "*.lbin" "*.so" "*.a" "*.ln" "*.blg" "*.bbl" "*.elc" "*.lof" "*.glo" "*.idx" "*.lot" "*.fmt" "*.tfm" "*.class" "*.fas" "*.lib" "*.mem" "*.x86f" "*.sparcf" "*.dfsl" "*.pfsl" "*.d64fsl" "*.p64fsl" "*.lx64fsl" "*.lx32fsl" "*.dx64fsl" "*.dx32fsl" "*.fx64fsl" "*.fx32fsl" "*.sx64fsl" "*.sx32fsl" "*.wx64fsl" "*.wx32fsl" "*.fasl" "*.ufsl" "*.fsl" "*.dxl" "*.lo" "*.la" "*.gmo" "*.mo" "*.toc" "*.aux" "*.cp" "*.fn" "*.ky" "*.pg" "*.tp" "*.vr" "*.cps" "*.fns" "*.kys" "*.pgs" "*.tps" "*.vrs" "*.pyc" "*.pyo" "TAGS" "tags"))
 '(grep-find-template
   "find -H -L <D> <X> -type f <F> -exec grep <C> -nH --null -e <R> \\{\\} +")
 '(grep-find-use-xargs 'exec-plus)
 '(help-enable-variable-value-editing t)
 '(help-window-keep-selected t)
 '(help-window-select t)
 '(horizontal-scroll-bar-mode nil)
 '(hscroll-margin 5)
 '(hscroll-step 1)
 '(ibuffer-default-shrink-to-minimum-size t)
 '(ibuffer-default-sorting-mode 'major-mode)
 '(ibuffer-use-other-window t)
 '(ido-ignore-directories '("\\`CVS/" "\\`\\.\\./" "\\`\\./"))
 '(ido-separator nil)
 '(ido-show-dot-for-dired t)
 '(ido-use-filename-at-point 'guess)
 '(imenu-auto-rescan t)
 '(isearch-lazy-count t)
 '(ivy-add-newline-after-prompt nil)
 '(ivy-display-style 'fancy)
 '(key-chord-mode t)
 '(large-file-warning-threshold 20000000000)
 '(line-spacing 0.1)
 '(magit-repository-directories '(("~/my_repos" . 1)))
 '(mouse-wheel-progressive-speed nil)
 '(num3-group-size 4)
 '(org-agenda-files '("/Users/raveenkumar/iCloud/org"))
 '(org-blank-before-new-entry '((heading . t) (plain-list-item)))
 '(org-capture-templates
   '(("p" "Plain text capture" entry
      (file "~/org/notes.org")
      "" :prepend t :empty-lines-after 1)))
 '(org-hide-leading-stars t)
 '(org-indent-indentation-per-level 4)
 '(org-journal-dir "~/iCloud/notes")
 '(org-journal-enable-agenda-integration t)
 '(org-journal-file-type 'weekly)
 '(package-name-column-width 20)
 '(package-selected-packages '(quelpa-use-package))
 '(package-status-column-width 10)
 '(package-version-column-width 10)
 '(pop-up-frames 'graphic-only)
 '(pop-up-windows nil)
 '(popper-group-function nil)
 '(popper-open-popup-hook '(popper-echo))
 '(project-vc-extra-root-markers
   '("Makefile" "index.org" ".dir-locals.el" "README" "readme.org" "README.org" "readme"))
 '(project-vc-ignores '("TAGS" "tags"))
 '(projectile-auto-discover nil)
 '(projectile-generic-command "find -L . -type f | cut -c3- | tr '\\n' '\\0'")
 '(repeat-mode t)
 '(require-final-newline t)
 '(scroll-bar-mode nil)
 '(scroll-conservatively 100)
 '(set-mark-command-repeat-pop t)
 '(straight-use-package-by-default t)
 '(tags-add-tables 'ask-user)
 '(tags-revert-without-query t)
 '(three-step-help nil)
 '(treemacs-indent-guide-mode t)
 '(treemacs-indentation 0)
 '(treemacs-indentation-string " ┃ ")
 '(truncate-lines 1)
 '(uniquify-min-dir-content 1)
 '(vc-follow-symlinks nil)
 '(verilog-auto-newline nil)
 '(windmove-create-window nil)
 '(windmove-default-keybindings '([ignore]))
 '(windmove-mode nil)
 '(window-divider-default-places t)
 '(window-divider-mode t)
 '(window-sides-vertical t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#2e3436" :foreground "#eeeeec" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight semi-bold :height 180 :width normal :foundry "nil" :family "Fira Code"))))
 '(aw-leading-char-face ((t (:foreground "red" :height 1.0 :width extra-expanded))))
 '(cursor ((t (:background "dark cyan"))))
 '(hi-green ((t (:background "black" :foreground "light green" :slant italic :weight bold))))
 '(highlight-thing ((t (:inherit 'hi-green))))
 '(num3-face-even ((t (:foreground "orange" :background "black" :underline "yellow" :weight bold))))
 '(num3-face-odd ((t nil)))
 '(org-default ((t (:inherit default :height 250 :family "Chalkboard"))))
 '(region ((t (:extend t :background "SeaGreen1" :foreground "black")))))

;; ;; '(electric-pair-mode t)
;; ;; '(electric-pair-pairs
;; ;;   '((34 . 34)
;; ;;     (8216 . 8217)
;; ;;     (8220 . 8221)
;; ;;     (40 . 41)
;; ;;     (123 . 125)
;; ;;     (93 . 93)))
;; ;; '(electric-pair-skip-whitespace-chars '(32 9 10))

;; ;; '(follow-auto t)

;; ;; '(goal-column 80)

;; '(show-smartparens-global-mode t)

;; '(next-line-add-newlines t)

;; '(show-trailing-whitespace t)

;; '(golden-ratio-auto-scale t)

;; '(tab-bar ((nil (:inherit variable-pitch :background "LightSalmon2" :foreground "black"))))
;;  '(tab-bar-tab-group-current ((t (:inherit tab-bar-tab :weight bold))))
;;  '(tab-bar-tab-inactive ((t (:background "gray13" :foreground "gray100"))))

;; '(tab-bar-close-button-show 'selected)
;; '(tab-bar-history-mode t)
;; '(tab-bar-mode nil)
;; '(tab-bar-new-button-show t)
;; '(tab-bar-position nil)
;; '(tab-bar-select-tab-modifiers nil)
;; '(tab-bar-tab-hints t)
;; '(tab-line-new-tab-choice t)

;; '(global-tab-line-mode nil)
