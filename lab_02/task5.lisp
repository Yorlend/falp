
;; (defun longer_than (x y)
;;   (cond
;;     ((eq x nil) nil)
;;     ((eq y nil) t)
;;     (t (longer_than (cdr x) (cdr y)))
;;   )
;; )

(defun longer_than (x y)
  (> (length x) (length y))
)

(let
  ((x (read))
   (y (read)))
  (format t "~A.~%" (longer_than x y))
  )
