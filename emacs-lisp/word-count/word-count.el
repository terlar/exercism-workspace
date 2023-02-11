;;; word-count.el --- word-count Exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(defun word-count (sentence)
  "Count words in SENTENCE."
  (seq-reduce
   (lambda (memo word)
     (let ((count (or (cdr (assoc word memo)) 0)))
       (cons (cons word (1+ count))
             (assoc-delete-all word memo))))
   (split-string (downcase sentence) "[^[:alnum:]']+" t "'+") nil))

(provide 'word-count)
;;; word-count.el ends here
