;; company-c-headers
(use-package company-c-headers
  :init
  (add-to-list 'company-backends 'company-c-headers))

;; hs-minor-mode for folding source code
(add-hook 'c-mode-common-hook 'hs-minor-mode)

;(use-package cc-mode
;  :config
;  (define-key c-mode-map  [(tab)] 'company-complete)
;  (define-key c++-mode-map  [(tab)] 'company-complete))

;; == irony-mode ==
(use-package irony
  :ensure t
  :defer t
  :init
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  ;(add-hook 'objc-mode-hook 'irony-mode)
  :config
  ;; replace the `completion-at-point' and `complete-symbol' bindings in
  ;; irony-mode's buffers by irony-mode's function
  (defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
      'irony-completion-at-point-async))
  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  )

;; == company-mode ==
(use-package company
  :ensure t
  :defer t
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  (delete 'company-semantic company-backends)
  :config
  (use-package company-irony
    :ensure t
    :defer t)
  (use-package company-c-headers
    :init
    (add-to-list 'company-backends 'company-c-headers))
  (setq
   company-idle-delay              nil
   company-minimum-prefix-length   2
   company-show-numbers            t
   company-tooltip-limit           20
   company-dabbrev-downcase        nil
   company-backends                '((company-irony company-gtags))
    )
  :bind
  ("C-;" . company-complete)
  )

(provide 'init-company)
