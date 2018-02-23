;;; ac-octave-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "ac-octave" "ac-octave.el" (23183 29318 980287
;;;;;;  924000))
;;; Generated autoloads from ac-octave.el

(ac-define-source octave '((candidates . ac-octave-candidate) (document . ac-octave-documentation) (candidate-face . ac-octave-candidate-face) (selection-face . ac-octave-selection-face) (init . ac-octave-init) (requires . 0) (cache) (symbol . "f")))

(autoload 'ac-octave-setup "ac-octave" "\
Add the Octave completion source to the front of `ac-sources'.

\(fn)" nil nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; ac-octave-autoloads.el ends here
