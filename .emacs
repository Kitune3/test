;; Set load-path
;(setq load-path (cons "~/.emacs.d" load-path))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))
;; show file path
(setq frame-title-format "%b - test")
; for indent
(add-hook 'c-mode-common-hook
	  '(lambda ()
	     (c-set-style "k&r")
	     (setq c-basic-offset 2)
	     (setq indent-tabs-mode nil)
	     (setq tab-width 2)))

(setq default-tab-width 8)
; no backupfile
(setq make-backup-files nil)
; shortcut for move-line
(global-set-key (kbd "M-g") 'goto-line)
;; go to another window
(windmove-default-keybindings)
(setq windmove-wrap-around t)
(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <down>") 'windmove-down)
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>")  'windmove-right)

;;; turn on syntax highlighting
(global-font-lock-mode 1)

;; for elpa
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://stable.melpa.org/packages/"))

(package-initialize)
;; for flycheck
(global-flycheck-mode)
(global-set-key (kbd "C-c l") 'flycheck-list-errors)

;; whitespace
(require 'whitespace)
(global-set-key (kbd "C-c w") 'whitespace-mode)
;; (global-whitespace-mode 1)

;; tramp
(setq tramp-default-method "ssh")
;; php

;(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/w3m")
;(require 'w3m-load)
;(setq browse-url-generic-program (executable-find "w3m")
;browse-url-browser-function 'browse-url-generic)

(autoload 'php-mode "php-mode")
(setq auto-mode-alist
      (cons '("\\.php\\'" . php-mode) auto-mode-alist))
(setq php-mode-force-pear t)
(add-hook 'php-mode-hook
  '(lambda ()
     (setq php-manual-path "/home/takinaga/php/doc/html")
     (setq php-manual-url "http://www.phppro.jp/phpmanual/")))
; 多分browserセットしたら必要なくなると思う
(defun my-php-symbol-lookup ()
  (interactive)
  (let ((symbol (symbol-at-point)))
    (if (not symbol)
        (message "No symbol at point.")

      (browse-url (concat "http://php.net/manual-lookup.php?pattern="
                          (symbol-name symbol))))))

;; mark
;; (setq pc-select-selection-keys-only t)
;; (pc-selection-mode 1)

(add-hook 'php-mode-hook
	  '(lambda()
	     (setq tab-width 4)
	     (setq c-basic-offset 4)
	        ))
;; gtags
(autoload 'gtags-mode "gtags" "" t)
(require `gtags)
(setq gtags-mode-hook
      '(lambda ()
         (define-key gtags-mode-map "\C-ct" 'gtags-find-tag)
         (define-key gtags-mode-map "\C-cr" 'gtags-find-rtag)
         (define-key gtags-mode-map "\M-s" 'gtags-find-symbol)
         (define-key gtags-mode-map "\C-cp" 'gtags-pop-stack)))
(add-hook 'c-mode-common-hook
          '(lambda()
             (gtags-mode 1)
             (gtags-make-complete-list)))

(add-hook 'js-mode-hook
          '(lambda()
             (gtags-mode 1)
             (gtags-make-complete-list)
	     (setq indent-tabs-mode nil)
	     (seq c-basic-offset 4)))

;; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(put 'upcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; nodejs
(require 'nodejs-repl)
