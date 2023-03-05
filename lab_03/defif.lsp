(load "~/quicklisp/setup.lisp")
(ql:quickload "unit-test")

(use-package 'unit-test)

(defun num-to-str (num)
  (if (complexp num)
      (format nil "~,2f + ~,2fi" (realpart num) (imagpart num))
      (format nil "~,2f" num)))


(defun kv (a b c)
    (if (zerop a)
        (if (zerop b)
            (if (zerop c)
                'inf
                'no-roots
            )
            (/ (- c) b)
        )
        (let* ((D (- (* b b) (* 4 a c)))
               (root1 (/ (+ b (sqrt D)) (* -2 a)))
               (root2 (/ (- b (sqrt D)) (* -2 a)))
              )
              (if (zerop D)
                  (/ (- b) (* 2 a))
                  `(,root1 ,root2)
              )
        )
    )
)

(defun kvf (ifname ofname)
    (with-open-file (out ofname
                        :direction         :output
                        :if-does-not-exist :create
                        :if-exists         :supersede
                    )
        (with-open-file (in ifname
                            :direction :input
                        )
            (let ((res (kv (read in)
                           (read in)
                           (read in)
                       ))
                 )
                 (if (eq res 'inf)
                     (format out "Бесконечное множество решений~%")
                     (if (eq res 'no-roots)
                         (format out "Нет корней~%")
                         (if (numberp res)
                             (format out "~A - корень кратности 2~%" (num-to-str res))
                             (format out "~A, ~A - корни~%" (num-to-str (first res)) (num-to-str (second res)))
                         )
                     )
                 )
            )
        )
    )
)

(deftest :unit-name "no roots"
    (test-assert (eq
        (kv 0 0 -6.0)
        'no-roots
        )))

(deftest :unit-name "too many roots"
    (test-assert (eq
        (kv 0 0 0)
        'inf
        )))

(deftest :unit-name "single real root"
    (test-assert (=
        (kv 0 3 -2)
        2/3
        )))

(deftest :unit-name "two real roots"
    (test-assert (equal
        (kv 2 -3 -20)
        '(-2.5 4.0)
        )))

(deftest :unit-name "two complex roots"
    (test-assert (equal
        (kv 1 -6 10)
        '(#C(3.0 -1.0) #C(3.0 1.0))
        )))

(run-all-tests)

(kvf "in.txt" "out.txt")
