(defun sort_two (x y)
  (cond
    ((> x y) (cons y (cons x nil)))
    (t (cons x (cons y nil)))
  )
)

(defun sort_two_q (x y)
  (cond
    ((> x y) `(,y ,x))
    (t `(,x ,y))
  )
)

(print (sort_two_q 9 4))


