(setq select-enable-clipboard t select-enable-primary t)

(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

(global-set-key [(meta m)] 'comment-region)
(global-set-key [(meta u)] 'uncomment-region)
(global-set-key "\M-g" 'goto-line)
(global-set-key [(meta o)] 'other-window)

;; (global-set-key [(meta p)] 'backward-paragraph)
;; (global-set-key [(meta n)] 'forward-paragraph)

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

(require-package 'key-chord)
(key-chord-mode 1)
(key-chord-define-global ".." 'ska-point-to-register)
(key-chord-define-global ",," 'ska-jump-to-register)

(setq avy-all-windows 'all-frames)
(key-chord-define-global "jw" 'ace-window)
(key-chord-define-global "jj" 'avy-goto-char-timer)
(key-chord-define-global "jk" 'avy-goto-word-or-subword-1)
(key-chord-define-global "jl" 'avy-goto-line)

(provide 'init-min)
