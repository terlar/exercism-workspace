;;; difference-of-squares.el --- Difference of Squares (exercism)

;;; Commentary:

;;; Code:
(defun sum-of-squares (n)
  "Sum of the squares of the first N natural numbers."
  (apply '+ (mapcar (lambda (val) (expt val 2))
                    (number-sequence 1 n))))

(defun square-of-sum (n)
  "Square of the sum of the first N natural numbers."
  (expt (apply '+ (number-sequence 1 n))
        2))

(defun difference (n)
  "Difference between sum of the squares and square of the sums for the first N natural numbers."
  (- (square-of-sum n) (sum-of-squares n)))

(provide 'difference-of-squares)
;;; difference-of-squares.el ends here
