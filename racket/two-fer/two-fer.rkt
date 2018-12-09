#lang racket

(define (two-fer [name "you"])
  (string-append "One for " name ", one for me."))

(provide two-fer)
