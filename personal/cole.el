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

;; TODO lists, ha
(setq org-agenda-files (list "~/Dropbox/Documents/todo.org"))

(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cc" 'org-capture)

;; unbind 'uu' from undo-tree mode
(key-chord-define-global "uu" nil)

;; go-autocomplete with gocode
(require 'auto-complete)
(require 'go-autocomplete)
(require 'auto-complete-config)
(add-hook 'go-mode-hook 'auto-complete-mode)
;; twitter
(setq twittering-use-master-password t)
(global-set-key (kbd "C-c C-t") 'twittering-update-status-interactive)

(setenv "PATH" "/usr/local/heroku/bin:/usr/local/opt/ruby/bin:/opt/local/bin:/usr/local/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/texbin/://usr/local/share/npm/bin:/Users/cole/code/android-sdk/platform-tools:~/code/go/bin")
(setenv "GOPATH" "/Users/cole/.gvm/pkgsets/go1.3/global")
(setq exec-path (cons "/Users/cole/.gvm/pkgsets/go1.3/global/bin" exec-path))
(add-to-list 'exec-path "/Users/cole/.gvm/pkgsets/go1.3/global/bin")

(add-hook `before-save-hook 'gofmt-before-save)

(global-auto-revert-mode 0)

(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

;;; cole.el ends here
