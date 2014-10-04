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

;(setq-default indent-tabs-mode nil)
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

;; evernote-mode

(add-to-list 'load-path "~/.emacs.d")
(require 'evernote-mode)
(setq evernote-username "<your evernote user name>") ; optional: you can use this username as default.
(setq evernote-enml-formatter-command '("w3m" "-dump" "-I" "UTF8" "-O" "UTF8")) ; optional
(global-set-key "\C-cec" 'evernote-create-note)
(global-set-key "\C-ceo" 'evernote-open-note)
(global-set-key "\C-ces" 'evernote-search-notes)
(global-set-key "\C-ceS" 'evernote-do-saved-search)
(global-set-key "\C-cew" 'evernote-write-note)
(global-set-key "\C-cep" 'evernote-post-region)
(global-set-key "\C-ceb" 'evernote-browser)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evernote-developer-token "S=s20:U=24a6a2:E=14fee2b5789:C=148967a2b70:P=1cd:A=en-devtoken:V=2:H=6c50cd531f3489b4c6821dfe6790a5e8")
 '(evernote-username "kitune3"))


;; tramp
(setq tramp-default-method "ssh")
