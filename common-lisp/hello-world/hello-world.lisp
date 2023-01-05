(defpackage #:hello-world
            (:use #:common-lisp)
            (:export #:hello)
            (:nicknames #:hw))

(in-package #:hello-world)

(defun hello ()
  (concatenate 'string "Hello, World!"))
