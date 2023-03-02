(defun between (x y z)
  (or (> z x y) (> y x z))
)

(print (between 9 11 9))
