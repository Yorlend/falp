(defun para_area (a b c)
  (* a (* b c))
)

(let
  ((a (read))
   (b (read))
   (c (read)))
  (format t "The area of parallelepiped with sides: ~A, ~A and ~A is ~A.~%" a b c (para_area a b c))
)
