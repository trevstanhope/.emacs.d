;;;; Emacs Init-file
;;; by Trevor Stanhope
;;; February 12th, 2013

;;; Custom Set Variables
(custom-set-variables
 '(cua-mode t nil (cua-base))
 '(inhibit-default-init t)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice nil)
 '(initial-scratch-message ";;;; Lisp Scratch Buffer")
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))

;;; Custom Set Faces
(custom-set-faces
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "bitstream" :family "Courier 10 Pitch")))))

;;; Modules Path
(add-to-list 'load-path
	     "~/.emacs.d/modules")

;;; Auto Pair
(require 'autopair)
(autopair-global-mode) ;; enabled in all buffers

;;; Auto Complete
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories 
	     "~/.emacs.d/ac-dict")

;;; Erlang
;(setq load-path (cons "/usr/lib/erlang/lib/tools-2.6.6.3/emacs" load-path))
;(setq erlang-root-dir "/usr/lib/erlang")
;(setq exec-path (cons "/usr/lib/erlang/bin" exec-path))
;(require 'erlang-start)

;;; Markdown
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist 
      (cons '("\\.md" . markdown-mode) auto-mode-alist))

;;; Arduino
(setq auto-mode-alist 
      (cons '("\\.\\(pde\\|ino\\)$" . arduino-mode) auto-mode-alist))
(autoload 'arduino-mode "arduino-mode" "Arduino editing mode." t)

;;; Python
(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(require 'lambda-mode)
(add-hook 'python-mode-hook
	  #'lambda-mode 1)
(setq lambda-symbol
      (string (make-char 'greek-iso8859-7 107)))
(add-hook 'python-mode-hook 
	  #'(lambda () (push '(?' . ?') (getf autopair-extra-pairs :code))
	      (setq autopair-handle-action-fns
		    (list #'autopair-default-handle-action
			  #'autopair-python-triple-quote-action))))
