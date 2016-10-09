(require-package 'diminish)

(require-package 'guide-key)
(setq guide-key/guide-key-sequence '("C-x" "C-c" "C-x 4" "C-x 5" "C-c ;" "C-c ; f" "C-c ' f" "C-x n" "C-x C-r" "C-x r"))
(guide-key-mode 1)
(diminish 'guide-key-mode)

(require-package 'undo-tree)
(global-undo-tree-mode)
(diminish 'undo-tree-mode)

(require-package 'highlight-symbol)
(dolist (hook '(prog-mode-hook html-mode-hook css-mode-hook))
  (add-hook hook 'highlight-symbol-mode)
  (add-hook hook 'highlight-symbol-nav-mode))
(add-hook 'org-mode-hook 'highlight-symbol-nav-mode)
(after-load 'highlight-symbol
  (diminish 'highlight-symbol-mode)
  (defadvice highlight-symbol-temp-highlight (around sanityinc/maybe-suppress activate)
    "Suppress symbol highlighting while isearching."
    (unless (or isearch-mode
                (and (boundp 'multiple-cursors-mode) multiple-cursors-mode))
      ad-do-it)))

(set-face-background 'highlight nil)
;;----------------------------------------------------------------------------
;; Expand region
;;----------------------------------------------------------------------------
(require-package 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(require-package 'highlight-escape-sequences)
(hes-mode)

(require-package 'window-numbering)
(window-numbering-mode 1)
(global-set-key (kbd "M-[") 'previous-multiframe-window)
(global-set-key (kbd "M-]") 'next-multiframe-window)


;;; Whitespace

(setq-default show-trailing-whitespace t)

(defun sanityinc/no-trailing-whitespace ()
  "Turn off display of trailing whitespace in this buffer."
  (setq show-trailing-whitespace nil))

;; But don't show trailing whitespace in SQLi, inf-ruby etc.
(dolist (hook '(special-mode-hook
                Info-mode-hook
                eww-mode-hook
                term-mode-hook
                comint-mode-hook
                compilation-mode-hook
                twittering-mode-hook
                minibuffer-setup-hook))
  (add-hook hook #'sanityinc/no-trailing-whitespace))


(require-package 'whitespace-cleanup-mode)
(global-whitespace-cleanup-mode t)

(global-set-key [remap just-one-space] 'cycle-spacing)

;; window number setting
(require-package 'window-numbering)
(window-numbering-mode 1)


;; ----------------------------------------------------------------------------
;; Enable desired features for all lisp modes
;; ----------------------------------------------------------------------------
(require-package 'rainbow-delimiters)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'c++-mode-hook 'rainbow-delimiters-mode)

;;----------------------------------------------------------------------------
;; Cut/copy the current line if no region is active
;;----------------------------------------------------------------------------
(require-package 'whole-line-or-region)
(whole-line-or-region-mode t)
(diminish 'whole-line-or-region-mode)
(make-variable-buffer-local 'whole-line-or-region-mode)

(provide 'init-utils)
