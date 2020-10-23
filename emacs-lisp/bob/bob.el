;;; bob.el --- Bob exercise (exercism)

;;; Commentary:

;;; Code:
(require 'subr-x)

(defun question-p (input)
  "INPUT is considered to be a question."
  (string-suffix-p "?" input))

(defun yelling-p (input)
  "INPUT is considered yelling."
  (let ((case-fold-search nil))
    (and (string-match-p "[A-Z]" input)
         (not (string-match-p "[a-z]" input)))))

(defun response-for (input)
  "Bob's response to INPUT."
  (pcase (string-trim input)
    ((and (pred yelling-p) (pred question-p))
     "Calm down, I know what I'm doing!")
    ((pred question-p) "Sure.")
    ((pred yelling-p) "Whoa, chill out!")
    ((pred string-empty-p) "Fine. Be that way!")
    (_ "Whatever.")))

(provide 'bob)
;;; bob.el ends here
