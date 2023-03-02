(defun abs_inc (x)
  (cond
    ((> x 0) (+ x 1))
    (t (- x 1))
  )
)

(print (abs_inc -5))
