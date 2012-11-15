(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(inhibit-default-init nil)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice t)
 '(initial-scratch-message "; Scratch & Notes
;; Emacs
;;; C-x C-f, visit new file
;;; C-x C-s, save file
;;; C-x b, switch buffer
;; Python
;;; C-c !, start interpreter
;;; C-c C-c, send current file to interpreter
;;; C-M-x, send current function definition to interpreter
;;; C-c ret, reload current file as python module
;; Erlang
;;; C-c C-z, start interpreter
;;; C-c C-k, compile buffer
;; Lisp
;;; C-x C-e, execute current lisp expression
")
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "bitstream" :family "Courier 10 Pitch")))))

;; Modules Load Path
(add-to-list 'load-path "~/.emacs.d/modules")

;; Auto Pair
(require 'autopair)
(autopair-global-mode) ;; enabled in all buffers

;; Auto Complete
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

;; Erlang
(setq load-path (cons "/usr/lib/erlang/lib/tools-2.6.6.3/emacs" load-path))
(setq erlang-root-dir "/usr/lib/erlang")
(setq exec-path (cons "/usr/lib/erlang/bin" exec-path))
(require 'erlang-start)

;; Markdown
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist)) 
