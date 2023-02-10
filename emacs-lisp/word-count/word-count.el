;;; word-count.el --- word-count Exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

(defun word-count (sentence)
  "Count words in SENTENCE."
  (seq-reduce
   (lambda (acc value)
     (let* ((word (string-trim value "'+" "'+"))
            (word-count (cdr (assoc word acc))))
       (if word-count
           (append `((,word . ,(1+ word-count)))
                   (assoc-delete-all word acc))
         (append `((,word . 1))
                 acc))))
   (split-string (downcase sentence) "[^[:alnum:]']+" t) nil))

(provide 'word-count)
;;; word-count.el ends here
