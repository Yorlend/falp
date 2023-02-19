(defun hypot (a b)
  (sqrt (+ (* a a) (* b b)))
)

(let
  ((a (read))
   (b (read)))
  (format t "Having cathetus ~A and ~A, the hypotenuse is ~A.~%" a b (hypot a b))
)
