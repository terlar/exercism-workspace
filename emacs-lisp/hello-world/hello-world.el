;;; hello-world.el --- Hello World Exercise (exercism)

;;; Commentary:

;;; Code:

(defun hello (&optional name)
  "Optionally takes a NAME to greet."
  (if name
      (format "Hello, %s!" name)
    "Hello, World!"))

(provide 'hello-world)
;;; hello-world.el ends here