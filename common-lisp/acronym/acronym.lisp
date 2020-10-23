(in-package #:cl-user)
(defpackage #:acronym
  (:use #:common-lisp)
  (:export #:acronym))

(in-package #:acronym)

(defun acronym-letter? (curr prev)
  "Check if CURR letter is part of the acronym by also checking the PREV."
  (and (alphanumericp curr)
       (or (not (alpha-char-p prev))
           (and (upper-case-p curr)
                (lower-case-p prev)))))

(defun acronym (phrase)
  "Create an acronym for the PHRASE."
  (coerce
   (loop for (prev curr) on (concatenate 'list " " phrase)
         while curr
         when (acronym-letter? curr prev)
         collect (char-upcase curr))
   'string))