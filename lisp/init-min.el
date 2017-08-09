(setq select-enable-clipboard t select-enable-primary t)

(defun copy-from-osx ()
  "Handle copy/paste intelligently on osx."
  (let ((pbpaste (purecopy "/usr/bin/pbpaste")))
    (if (and (eq system-type 'darwin)
             (file-exists-p pbpaste))
        (let ((tramp-mode nil)
              (default-directory "~"))
          (shell-command-to-string pbpaste)))))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx
      interprogram-paste-function 'copy-from-osx)

(global-set-key [(meta m)] 'comment-region)
(global-set-key [(meta u)] 'uncomment-region)
(global-set-key "\M-g" 'goto-line)
(global-set-key [(meta o)] 'other-window)

(global-set-key [(meta P)] 'backward-paragraph)
(global-set-key [(meta N)] 'forward-paragraph)

(defun ska-point-to-register()
  "Store cursorposition _fast_ in a register.
  Use ska-jump-to-register to jump back to the stored
  position."
  (interactive)
  (setq zmacs-region-stays t)
  (point-to-register 8))

(defun ska-jump-to-register()
  "Switches between current cursorposition and position
  that was stored with ska-point-to-register."
  (interactive)
  (setq zmacs-region-stays t)
  (let ((tmp (point-marker)))
    (jump-to-register 8)
    (set-register 8 tmp)))

(provide 'init-min)
