(require-package 'key-chord)

(global-evil-leader-mode 1)
(key-chord-mode 1)
(require 'evil)
(evil-mode 1)
;; Max time delay between two key presses to be considered a key chord
(setq key-chord-two-keys-delay 0.1) ; default 0.1

;; Max time delay between two presses of the same key to be considered a key chord.
;; Should normally be a little longer than `key-chord-two-keys-delay'.
(setq key-chord-one-key-delay 0.2) ; default 0.2

(key-chord-define-global ".." 'ska-point-to-register)
(key-chord-define-global ",," 'ska-jump-to-register)

;; (setq avy-all-windows 'all-frames)
;; (key-chord-define-global "jw" 'ace-window)
;; (key-chord-define-global "jj" 'avy-goto-char-timer)
;; (key-chord-define-global "jk" 'avy-goto-word-or-subword-1)
;; (key-chord-define-global "jl" 'avy-goto-line)

(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "jk" 'avy-goto-word-or-subword-1
  "jj" 'avy-goto-char-timer
  "b" 'switch-to-buffer
  "k" 'kill-buffer)

;; (unless (display-graphic-p)
;;   (require 'evil-terminal-cursor-changer)
;;   (etcc-on)
;;   )
;; (setq evil-motion-state-cursor 'box)  ; █
;; (setq evil-visual-state-cursor 'box)  ; █
;; (setq evil-normal-state-cursor 'box)  ; █
;; (setq evil-insert-state-cursor 'bar)  ; ⎸
;; (setq evil-emacs-state-cursor  'hbar) ; _
;;

;; (key-chord-define evil-normal-state-map "SPC" 'ave-window)
;; (key-chord-define evil-insert-state-map "SPC" 'ave-goto-word-or-subword-1)

(provide 'init-evil-mode)
