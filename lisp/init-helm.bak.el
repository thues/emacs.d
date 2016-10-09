;; init-helm.el

;;; helm mode settings
(require-package 'helm)

;(require-package 'helm-projectile)
;(projectile-global-mode)
;(setq projectile-completion-system 'helm)
;(helm-projectile-on)

(require 'helm-config)
(global-set-key (kbd "S-x") 'helm-M-x) ;; replace default M-x
(global-set-key (kbd "C-c h") 'helm-mini) ;;replace ibuffer
(global-set-key (kbd "C-x C-f") 'helm-find-files) ;;replace default open file


(setq
 helm-M-x-fuzzy-match t
; helm-recentf-fuzzy-match t
 helm-buffers-fuzzy-matching t
 helm-locate-fuzzy-match t
 helm-semantic-fuzzy-match t
 helm-imenu-fuzzy-match t
 helm-apropos-fuzzy-match t
 helm-lisp-fuzzy-completion t)

(provide 'init-helm)
