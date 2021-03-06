

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path
	     (expand-file-name "lisp" user-emacs-directory))

(require 'init-elpa)

(require 'init-define)
(require 'init-fonts)
(require 'init-frame)
(require 'init-theme)
(require 'init-utils)

(require 'init-dired)
(require 'init-helm)
(require 'init-ggtags)
(require 'init-company)
(require 'init-c-cpp)

(require 'init-final)


;(require 'init-ibuffer)
