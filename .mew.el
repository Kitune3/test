(setq mew-pop-user "<your email address>")
(setq mew-pop-server "pop.gmail.com")
(setq mew-pop-delete nil)  ;; nil の場合、サーバからメールを削除しない
(setq mew-pop-ssl t)
(setq mew-pop-ssl-port 995)
(setq mew-pop-auth 'pass)
(setq mew-prog-ssl "stunnel")
(setq mew-ssl-cert-directory "/etc/stunnel")
(setq mew-ssl-verify-level 0)

(setq mew-smtp-auth t)
(setq mew-smtp-ssl t)
(setq mew-smtp-ssl-port "465")
(setq mew-smtp-user "your email address")
(setq mew-smtp-server "smtp.gmail.com")
(setq mew-fcc "%Sent") ; save sent mail
(setq mew-imap-trash-folder "%[Gmail]/trush")
(setq mew-use-cached-passwd t)
