;;; sly-scheme.el --- Support Scheme programs running under Common Lisp
;;
;; Authors: Matthias Koeppe  <mkoeppe@mail.math.uni-magdeburg.de>
;; 
;; License: GNU GPL (same license as Emacs)
;;
;;; Installation:
;;
;; Add this to your .emacs: 
;;
;;   (add-to-list 'load-path "<directory-of-this-file>")
;;   (add-hook 'sly-load-hook (lambda () (require 'sly-scheme)))
;;
(eval-and-compile
  (require 'sly))

(defun sly-scheme-indentation-update (symbol indent packages)
  ;; Does the symbol have an indentation value that we set?
  (when (equal (get symbol 'scheme-indent-function)
	       (get symbol 'sly-scheme-indent))
    (put symbol 'sly-scheme-indent indent)
    (put symbol 'scheme-indent-function indent)))


;;; Initialization

(defun sly-scheme-init ()
  (add-hook 'scheme-mode-hook 'sly-editing-mode)
  (add-hook 'sly-indentation-update-hooks 'sly-scheme-indentation-update))

(defun sly-scheme-unload ()
  (remove-hook 'scheme-mode-hook 'sly-editing-mode)
  (remove-hook 'sly-indentation-update-hooks 'sly-scheme-indentation-update))

(provide 'sly-scheme)