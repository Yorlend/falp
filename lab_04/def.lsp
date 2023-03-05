(defun my-reverse (lst)
    (cond ((null lst) nil)
          (`(,@(my-reverse (cdr lst)) ,(car lst)))
    )
)

(defun help-append (lst1 lst2)
    (if (null lst1)
        lst2
        (let ((res (copy-list lst1)))
             (and (rplacd (last res)
                          lst2
                  )
             res
             )
        )
    )
)

(defun my-append (&rest lst)
    (and lst
         (reduce #'help-append lst :from-end t)
    )
)