;;; gigasecond.el --- Gigasecond exercise (exercism)

;;; Commentary:
;; Calculate the date one gigasecond (10^9 seconds) from the
;; given date.
;;
;; NB: Pay attention to  Emacs' handling of time zones and dst
;; in the encode-time and decode-time functions.

;;; Code:
(defun from (&rest args)
  "Calculate the date one gigasecond later than given date.
The date is given in `encode-time'/`decode-time' compatible format as ARGS."
  (butlast (decode-time (time-add (apply #'encode-time (append args '(0)))
                                  (expt 10 9))
                        0)
           3))

(provide 'gigasecond)
;;; gigasecond.el ends here