;;;==================
;;; Some hook
;;;==================

;;; variable
(setq emacs-tmp-directory (expand-file-name "temp" user-emacs-directory))
(setq custom-file (expand-file-name "sys-custom.el" emacs-tmp-directory))
(setq session-save-file (expand-file-name ".session" emacs-tmp-directory))
(setq mc/list-file (expand-file-name "mc-lists.el" emacs-tmp-directory))


(use-package desktop
  :config
  (desktop-save-mode t)
  :init
  (add-hook 'after-init-hook 'desktop-read)
  (add-hook 'kill-emacs-hook
          '(lambda()(desktop-save emacs-tmp-directory))))


;; remove auto-save-list directory
(setq auto-save-list-file-prefix nil)
;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
	  `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
	  `((".*" ,temporary-file-directory t)))


(defalias 'yes-or-no-p 'y-or-n-p)

;; color of select region
;(set-face-attribute 'region nil :background "#666")

;; indent
(setq-default c-basic-offset 4
			  tab-width 4
			  indent-tabs-mode nil)

;; save desktop
(setq-default desktop-save-mode nil)

;; linum
(global-linum-mode t)
;; delete whitespace while save the file
;(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;; Newline behaviour
;(global-set-key (kbd "RET") 'newline-and-indent)
;(defun sanityinc/newline-at-end-of-line ()
;  "Move to end of line, enter a newline, and reindent."
;  (interactive)
;  (move-end-of-line 1)
;  (newline-and-indent))
;(global-set-key (kbd "S-<return>") 'sanityinc/newline-at-end-of-line)


;;----------------------------------------------------------------------------
;; Show matching parens
;;----------------------------------------------------------------------------
(show-paren-mode 1)


;; fullscreen
(global-set-key (kbd "M-RET") 'toggle-frame-fullscreen)

;;----------------------------------------------------------------
;; MAC && HHKB
;; Change command key as meta
;;----------------------------------------------------------------
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

(provide 'init-final)
