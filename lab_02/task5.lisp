(defun longer_than (x y)
  (if (and (null x) (null y))
    nil
    (if (and (null x) y)
      nil
      (if (and x (null y))
	t
	(format t "~A.~%" (longer_than (cdr x) (cdr y)))
	)
      )
    )
  )

(let
  ((x (read))
   (y (read)))
  (format t "~A.~%" (longer_than x y))
  )
