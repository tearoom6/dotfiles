;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;; ~/emacs.d/init.el
;; emacs Personal Preference File @tearoom6

;;;;;;;;;; SetUp ;;;;;;;;;;

;;;; load Common Lisp For Emacs
(require 'cl)

;;;; language settings
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
;; MacOSX
(require 'ucs-normalize)
(setq file-name-coding-system 'utf-8-hfs)
(setq locale-coding-system 'utf-8-hfs)
;; Windows
; (setq file-name-coding-system 'sjis)
; (setq locale-coding-system 'utf-8)
;; Linux, etc
; (setq file-name-coding-system 'utf-8)
; (setq locale-coding-system 'utf-8)

;;;; [add-to-load-path]
;;;; - function to add load path
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

;; add load path
(add-to-load-path "elisp" "conf")

;;;; setting of auto-install.el
(when (require 'auto-install nil t)
  (setq auto-install-directory "~/.emacs.d/elisp/")
  (auto-install-update-emacswiki-package-name t)
  (auto-install-compatibility-setup))

;;;;;;;;;; Extensions ;;;;;;;;;;

;;;; [cua-mode]
;;;; - strong rectangular selection
(require 'cua-mode nil t)
(cua-mode t)
(setq cua-enable-cua-keys nil)

;;;; [php-mode]
;;;; - extension for PHP coding
;(install-elisp "https://raw.github.com/ejmr/php-mode/master/php-mode.el")
(when (require 'php-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.ctp$" . php-mode)))

;;;; [emacs-cake]
;;;; - extension to assist to use CakePHP
;(install-elisp "https://raw.github.com/k1LoW/emacs-historyf/master/historyf.el")
;(install-elisp "https://raw.github.com/k1LoW/emacs-cake/master/ac-cake.el")
;(install-elisp "https://raw.github.com/k1LoW/emacs-cake/master/cake-inflector.el")
;(install-elisp "https://raw.github.com/k1LoW/emacs-cake/master/cake.el")
(when (require 'cake nil t)
  (global-cake t))

;;;; [css-mode]
;;;; - extension for CSS coding
;(install-elisp "http://www.garshol.priv.no/download/software/css-mode/css-mode.el")
(when (require 'css-mode nil t)
  (setq cssm-indent-function #'cssm-c-style-indenter)
  (setq cssm-indent-level 2)
  (setq-default indent-tabs-mode nil)
  (setq cssm-newline-before-closing-bracket t))

;;;; [scratch-log]
;;;; long scratch buffer and restore next time
;(install-elisp "https://raw.github.com/mori-dev/scratch-log/master/scratch-log.el")
(when (require 'scratch-log.el nil t)
  (setq sl-scratch-log-file "~/.emacs.d/.scratch-log")
  (setq sl-prev-scratch-string-file "~/.emacs.d/.scratch")
  ;; don't restore if this value is nil (default t)
  (setq sl-restore-scratch-p t)
  ;; you can clear scratch buffe if this value is nil (default t)
  (setq sl-prohibit-kill-scratch-buffer-p t))

;;;; [redo+.el]
;;;; - add redo function
;(install-elisp "http://www.emacswiki.org/emacs/download/redo+.el")
(when (require 'redo+ nil t)
  ;; [C-'] : redo
  (define-key global-map (kbd "C-'") 'redo))

;;;; [color-moccur / moccur-edit]
;;;; - find / grep to multi-buffer
;(install-elisp "http://www.emacswiki.org/emacs/download/color-moccur.el")
;(install-elisp "http://www.emacswiki.org/emacs/download/moccur-edit.el")
(when (require 'color-moccur nil t)
  (define-key global-map (kbd "M-o") 'occur-by-moccur)
  (setq moccur-split-word t)
  (add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
  (add-to-list 'dmoccur-exclusion-mask "^#.+#$")
  (require 'moccur-edit nil t)
  (when (and (executable-find "cmigemo")
             (require 'migemo nil t))
    (setq moccur-use-migemo t)))

;;;; [grep-edit]
;;;; - grep and edit files
;(install-elisp "http://www.emacswiki.org/emacs/download/grep-edit.el")
(require 'grep-edit)

;;;; [Migemo]
;;;; - romaji incremental search
;(install-elisp "https://raw.github.com/emacs-jp/migemo/master/migemo.el")
(when (and (executable-find "cmigemo")
           (require 'migemo nil t))
  ;; depend on cmigemo
  (setq migemo-command "cmigemo")
  (setq migemo-options '("-q" "--emacs" "-i" "\a"))
  (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-use-pattern-alist t)
  (setq migemo-use-frequent-pattern-alist t)
  (setq migemo-pattern-alist-length 1000)
  (setq migemo-coding-system 'utf-8-unix)
  (migemo-init))

;;;; [undohist]
;;;; - undo to closed buffer
;(install-elisp "http://cx4a.org/pub/undohist.el")
(when (require 'undohist nil t)
  (undohist-initialize))

;;;; [undo-tree]
;;;; - display undo history tree
;(install-elisp "http://www.dr-qubit.org/undo-tree/undo-tree.el")
(when (require 'undo-tree nil t)
  (global-undo-tree-mode))

;;;; [point-undo]
;;;; - undo at current cursor position
;(install-elisp "http://www.emacswiki.org/cgi-bin/wiki/download/point-undo.el")
(when (require 'point-undo nil t)
  (define-key global-map (kbd "M-[") 'point-undo)
  (define-key global-map (kbd "M-]") 'point-redo))

;;;; [wdired]
;;;; - rename files in dired
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;;;; [auto-complete-mode]
;;;; - strong complement
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/ac-dict")
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (ac-config-default))

;;;; [smartchr]
;;;; - cycle snippet
;(install-elisp "https://raw.github.com/imakado/emacs-smartchr/master/smartchr.el")
(when (require 'smartchr nil t)
  (define-key global-map (kbd "=") (smartchr '("=" " = " " == " " === ")))
  (defun css-mode-hooks ()
    (define-key cssm-mode-map (kbd ":") (smartchr '(": " ":"))))
  (add-hook 'css-mode-hook 'css-mode-hooks))

;;;; [ElScreen]
;;;; - window management like Screen
;(when (require 'elscreen nil t)
;  (if window-system
;    (define-key elscreen-map (kbd "C-z") 'iconify-or-deiconify-frame)
;    (define-key elscreen-map (kbd "C-z") 'suspend-emacs)))

;;;; [Anything]
;;;; - integrated interface of Emacs
(when (require 'anything nil t)
  ;; [M-f] : anything
  (define-key global-map (kbd "M-f") 'anything)
  ;; [M-y] : anything-show-kill-ring
  (define-key global-map (kbd "M-y") 'anything-show-kill-ring)
  (setq
    ;; wait time until display candidates (default 0.5)
    anything-idle-delay 0.3
    ;; wait time until re-draw (default 0.1)
    anything-input-idle-delay 0.2
    ;; max display number of candidates (default 50)
    anything-candidate-number-limit 100
    ;; fasten feeling speed when many candidates
    anything-quick-update t
    ;; select-candidate shortcut
    anything-enable-shortcuts 'alphabet)
  ;;;; [anything-config]
  (when (require 'anything-config nil t)
    ;; command to call by root user (default su)
    (setq anything-su-or-sudo "sudo"))
  ;;;; [anything-match-plugin]
  (require 'anything-match-plugin nil t)
  (and (equal current-language-environment "Japanese")
       (executable-find "cmigemo")
       (require 'anything-migemo nil t))
  ;;;; [anything-complete]
  (when (require 'anything-complete nil t)
    ;; use Anything by M-x completion
    ;(anything-read-string-mode 1)
    ;; interval time to find lisp symbol completion
    (anything-lisp-complete-symbol-set-timer 150))
  ;;;; [anything-show-completion]
  (require 'anything-show-completion nil t)
  ;;;; [anything-auto-install]
  (when (require 'auto-install nil t)
    (require 'anything-auto-install nil t))
  ;;;; [descbinds-anything]
  (when (require 'descbinds-anything nil t)
    ;; replace describe-bindings to Anything
    (descbinds-anything-install))
  ;;;; [anything-grep]
  (require 'anything-grep nil t)
  ;;;; [anything-project]
  ;;;; - select files from project
  ;(install-elisp "https://raw.github.com/imakado/anything-project/master/anything-project.el")
  (when (require 'anything-project nil t)
    (global-set-key (kbd "C-c C-f") 'anything-project)
    (setq ap:project-files-filters
          (list
           (lambda (files)
             (remove-if 'file-directory-p files)
             (remove-if '(lambda (file) (string-match-p "~$" file)) files)))))
  ;;;; [anything-c-moccur]
  ;;;; - Anything interface of Moccur
  ;(install-elisp "http://svn.coderepos.org/share/lang/elisp/anything-c-moccur/trunk/anything-c-moccur.el")
  (when (require 'anything-c-moccur nil t)
    (setq
      anything-c-moccur-anything-idle-delay 0.1
      anything-c-moccur-higligt-info-line-flag t
      anything-c-moccur-enable-auto-look-flag t
      anything-c-moccur-enable-initial-pattern t)
    (global-set-key (kbd "C-M-o")
                    'anything-c-moccur-occur-by-moccur))
  ;;;; [anything-for-document] (self-defined command)
  (setq anything-for-document-sources
      (list anything-c-source-man-pages
            anything-c-source-info-cl
            anything-c-source-info-pages
            anything-c-source-info-elisp
            anything-c-source-apropos-emacs-commands
            anything-c-source-apropos-emacs-functions
            anything-c-source-apropos-emacs-variables))
  ;; define anything-for-document command
  (defun anything-for-document ()
    "Preconfigured `anything' for anything-for-document."
    (interactive)
    (anything anything-for-document-sources (thing-at-point 'symbol) nil nil nil "*anything for document*"))
  ;; [s-d] : anything-for-document
  (define-key global-map (kbd "s-d") 'anything-for-document)
  )

;;;;;;;;;; Functions ;;;;;;;;;;

;;;; Restore recent closed buffer
(defvar my-killed-file-name-list nil)
(defun my-push-killed-file-name-list ()
  (when (buffer-file-name)
    (push (expand-file-name (buffer-file-name)) my-killed-file-name-list)))
(defun my-pop-killed-file-name-list ()
  (interactive)
  (unless (null my-killed-file-name-list)
    (find-file (pop my-killed-file-name-list))))
(add-hook 'kill-buffer-hook 'my-push-killed-file-name-list)
(define-key global-map (kbd "s-z") 'my-pop-killed-file-name-list)

;;;;;;;;;; Customize ;;;;;;;;;;

;;;; cancel default-display options
;; start-up message
(setq inhibit-startup-screen t)
;; menu-bar
(menu-bar-mode 0)
(when window-system
  ;; tool-bar
  (tool-bar-mode 0)
  ;; scroll-bar
  (scroll-bar-mode 0))

;;;; about display options
;; line number
(global-linum-mode)
;; title format
(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))
;; blink cursor
(blink-cursor-mode t)
;; about parentheses (^-^)
(setq show-paren-delay 0)
(show-paren-mode t)
(setq show-paren-style 'expression)
(set-face-background 'show-paren-match-face nil)
(set-face-underline-p 'show-paren-match-face "yellow")
;; about indent
;(setq-default indent-tabs-mode nil)
;(setq-default tab-width 4)
;(setq js-indent-level 4)
;(setq cperl-indent-level 4)

;;;; about view
;; set color-theme
(when window-system
  (require 'color-theme nil t)
  (color-theme-initialize)
  (color-theme-hober))
;; customize hi-line-face
;(defface my-hl-line-face
;  '((((class color) (background dark))
;     (:background "NavyBlue" t))
;    (((class color) (background light))
;     (:background "LightGoldenrodYellow" t))
;    (t (:bold t)))
;  "hl-line's my face")
;(setq hl-line-face 'my-hl-line-face)
;; turn on hi-line-mode always
;(global-hl-line-mode t)
;; font-setting Emacs23 for Mac
(when (eq window-system 'ns)
  ;; standard font
  (set-face-attribute 'default nil :family "Menlo" :height 120) ;12pt
  ;; japanese-font
  (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Hiragino_Mincho_ProN"))
  ;; font-width
  (setq face-font-rescale-alist
        '((".*Menlo.*" . 1.0)
          (".*Hiragino_Mincho_ProN.*" . 1.2)
          (".*Hiragino_Kaku_Gothic_ProN.*" . 1.2))))

;;;; about user action
;; switch 'yes-or-no' to 'y-or-n'
;(fset 'yes-or-no-p 'y-or-n-p)
;; open file or url on current cursor by C-x C-f
(ffap-bindings)

;;;; key-bind
;; [C-m] : newline and indent
(define-key global-map (kbd "C-m") 'newline-and-indent)
;; [M-k] : kill-this.buffer
(define-key global-map (kbd "M-k") 'kill-this-buffer)
;; [C-t] : other-window
(define-key global-map (kbd "C-t") 'other-window)
;; [s-<right>] : split-window-horizontally
(define-key global-map (kbd "s-<right>") 'split-window-horizontally)
;; [s-<down>] : split-window-vertically
(define-key global-map (kbd "s-<down>") 'split-window-vertically)
;; [s-w] : delete-window
(define-key global-map (kbd "s-w") 'delete-window)
;; [M-p](cperl-mode) : cperl-perldoc
;(define-key cperl-mode-map (kbd "M-p") 'cperl-perldoc)

;;;;;;;;;; Configuration ;;;;;;;;;;

;;;; Load file
;; ~/.emacs.d/conf/init-anything.el
;(load "init-anything")
