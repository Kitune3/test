;; Set load-path
(setq load-path (cons "~/.emacs.d" load-path))
;; show file path
(setq frame-title-format "%b - test")

; for indent
(add-hook 'c-mode-common-hook
          '(lambda ()
		 (c-set-style "k&r")
         (setq c-basic-offset 2)
	     (setq indent-tabs-mode nil)
	     (setq tab-width 2)))

; (setq-default indent-tabs-mode nil)
;(setq-default tab-width 4)
;(setq default-tab-width 4)
;(setq tab-stop-list '(4 8 16 20 24 28 32 36 40))
;(setq c-tab-always-indent t)
; way to deal buffer
(global-set-key (kbd "C-e") 'kill-buffer-and-window)
; shortcut for move-line
(global-set-key (kbd "M-g") 'goto-line)
;; go to another window
(windmove-default-keybindings)
(setq windmove-wrap-around t)
;;; turn on syntax highlighting
(global-font-lock-mode 1)
;; not divided
(setq inhibit-startup-message t)
;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(autoload 'groovy-mode "groovy-mode" "Major mode for editing Groovy code." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

;; set python mode
(add-to-list 'load-path "~/.emacs.d/")
(setq py-install-directory "~/.emacs.d/")
(require 'python-mode)

;;; make Groovy mode electric by default.
(add-hook 'groovy-mode-hook
          '(lambda ()
             (require 'groovy-electric)
             (groovy-electric-mode)))

;; gtags
(autoload 'gtags-mode "gtags" "" t)
(setq gtags-mode-hook
      '(lambda ()
         (local-set-key "\C-xt" 'gtags-find-tag)
         (local-set-key "\M-r" 'gtags-find-rtag)
         (local-set-key "\M-s" 'gtags-find-symbol)
         (local-set-key "\C-cp" 'gtags-pop-stack)))
(add-hook 'c-mode-common-hook
          '(lambda()
             (gtags-mode 1)
             (gtags-make-complete-list)))

;; auto-complete
(add-to-list 'load-path "/home/takuya/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/home/takuya/.emacs.d/ac-dict")
(ac-config-default)
(ac-set-trigger-key "TAB")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evernote-developer-token "<developers token>")
 '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)

;; use whitespace
(require 'whitespace)

;; For tilda
(setq make-backup-files nil)

;; default encoding 
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)

;; evernote-mode
(require 'evernote-mode)
     (setq evernote-username "<username>") ; optional: you can use this username as default.
     (setq evernote-enml-formatter-command '("w3m" "-dump" "-I" "UTF8" "-O" "UTF8")) ; optional

;; password-store
(require 'dash)
(require 'password-store)

;; tramp
(setq tramp-default-method "ssh")

;; 2ch
(push "/usr/local/share/emacs/site-lisp/" load-path)
(require 'navi2ch)
(setq navi2ch-list-bbstable-url
"http://menu.2ch.net/bbsmenu.html")
(autoload 'navi2ch "navi2ch" "Navigator for 2ch for Emacs" t)

;;; for graphics
(auto-image-file-mode t)

;; mew
(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)
 
;; Optional setup (Read Mail menu):
(setq read-mail-command 'mew)
 
;; Optional setup (e.g. C-xm for sending a message):
(autoload 'mew-user-agent-compose "mew" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'mew-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'mew-user-agent
      'mew-user-agent-compose
      'mew-draft-send-message
      'mew-draft-kill
      'mew-send-hook))

