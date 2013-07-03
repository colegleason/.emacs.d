;;; cole.el --- Summary:
;;; Commentary:
;;; Code:

;;; Tomorrow is today
(add-to-list 'load-path "~/.emacs.d/themes/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(disable-theme 'zenburn)
(load-theme 'tomorrow-night t)

;; Use Emacs terminfo, not system terminfo
(setq system-uses-terminfo nil)

;; fuck off, menu bar
(setq menu-bar-mode nil)
(provide 'cole)

;; Remap M-right and M-left in org mode
(require 'org)
(define-key org-mode-map  "\M-<left>" 'outline-do-demote)
(define-key org-mode-map "\M-<right>" 'outline-do-promote)

;; Line Numbering
(global-linum-mode 1)
(setq linum-format "%d ")

;; Auto fill mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(global-set-key (kbd "C-c q") 'auto-fill-mode)

;; js2-mode for Javascript
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; js-doc mode for js2
(add-hook 'js2-mode-hook
          #'(lambda ()
              (define-key js2-mode-map "\C-cj" 'js-doc-insert-function-doc)
              (define-key js2-mode-map "@" 'js-doc-insert-tag)))

;;; cole.el ends here
