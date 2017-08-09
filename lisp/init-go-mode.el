;; (require-package 'go-projectil)
(require-package 'flycheck)
(require-package 'gotest)
(require-package 'go-eldoc)
(require-package 'go-mode)

(defun go-mode-setup ()
  (setq compile-command "go build -v && go test -v && go vet")
  (define-key (current-local-map) "\C-c\C-c" 'compile)
  (go-eldoc-setup)
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (local-set-key (kbd "M-.") 'godef-jump))

;; As you type error highlighting
(add-hook 'after-init-hook #'global-flycheck-mode)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

(add-to-list 'load-path (concat (getenv "GOPATH")  "/src/github.com/golang/lint/misc/emacs"))
(require 'golint)

(require-package 'company)
(require-package 'company-go)
(add-hook 'go-mode-hook (lambda ()
                          (company-mode)
                          (set (make-local-variable 'company-backends) '(company-go))
                          (go-mode-setup)
                          ))


(provide 'init-go-mode)
