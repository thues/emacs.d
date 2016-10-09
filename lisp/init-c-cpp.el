;;;==================
;;; google cc format
;;;=====================
(require-package 'clang-format)
(global-set-key [C-tab] 'clang-format-region)
(setq clang-format-style-option "Google")

;; switch header&cpp
(add-hook 'c-mode-common-hook
	  (lambda()
	    (local-set-key  (kbd "C-c o") 'ff-find-other-file)))


(provide 'init-c-cpp)
