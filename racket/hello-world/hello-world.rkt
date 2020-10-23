#lang racket

(define (hello [name "World"])
  (format "Hello, ~a!" name))

(provide hello)