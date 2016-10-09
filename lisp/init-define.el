
(if (fboundp 'with-eval-after-load)
	(defalias 'after-load 'with-eval-after-load)
  (defmacro after-load (feature &rest body)
	"After FEATURE is loaded, evaluate BODY."
	(declare (indent defun))
	`(eval-after-load ,feature
	   '(progn ,@body))))

(require-package 'exec-path-from-shell)
(after-load 'exec-path-from-shell
  (dolist (var '("SSH_AUTH_SOCK" "SSH_AGENT_PID" "GPG_AGENT_INFO" "LANG" "LC_CTYPE"))
	(add-to-list 'exec-path-from-shell-variables var)))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))


(provide 'init-define)
