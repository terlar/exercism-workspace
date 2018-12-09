#lang racket
(define (square position)
  (expt 2 (- position 1)))

(define (total)
  (for/sum ([pos (in-range 1 65)])
    (square pos)))

(provide square total)
