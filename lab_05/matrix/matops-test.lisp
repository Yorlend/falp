(ql:quickload "fiveam" :silent t)
(use-package :fiveam)

(load "./matops.lisp")

(def-suite* new-matrix)

(test 0-len
    (is (eq (new-matrix 0)
            nil)))

(test single-item
    (is (equal (new-matrix 1 50/3) '((50/3)))))

(run!)
