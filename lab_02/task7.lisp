(defun f-to-c (temp)
  (* 5/9 (- temp 32.0))
)

(let
  ((x (read)))
  (format t "F: ~A~%C: ~A~%" x (f-to-c x))) 
