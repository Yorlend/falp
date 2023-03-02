(defun between_cond (x y z)
  (cond
    ((> x y) (> z x))
    ((> x z) (> y x))
  )
)

(defun between_if (x y z)
  (if (> x y)
    (> z x)
    (if (> x z)
      (> y x)))
)

(print (between_if 9 10 11))
