(defpackage #:hello-world
  (:use #:common-lisp)
  (:export #:hello)
  (:nicknames #:hw))

(in-package #:hello-world)

(defun hello (&optional (name "World"))
        (concatenate 'string "Hello, " name "!"))
