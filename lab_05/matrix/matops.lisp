;;; (list-of 4 x) => (x x x x)
(defun list-of (n elem)
    (cond
        ((eql n 0) nil)
        ((eql n 1) (list elem))
        (t (cons elem (list-of (- n 1) elem)))))

;;; (list-for n) => (0 1 2 3 ... n-1)
(defun list-for (end &optional (curr 0))
    (cond
        ((= curr end) nil)
        (t (cons curr (list-for end (+ 1 curr))))))

;;; Создает квадратную матрицу n x n
(defun new-matrix (n &optional (fill 0))
    (mapcar
        #'(lambda (_) (list-of n fill))
        (list-of n fill)))

;;; Проверяет, является ли mat квадратной числовой матрицей
(defun matrixp (mat)
    (if (listp mat)
        (let ((n (length mat)))
            (every #'(lambda (x) x)
                (mapcar #'(lambda (row)
                        (and
                            (listp row)
                            (= (length row) n)
                            (every #'numberp row)))
                    mat)))))

(defun mat-get (mat i j)
    (nth j (nth i mat)))

;;; Присоединяет единичную матрицу справа к данной
(defun extend-mat (mat)
    (let ((n (length mat)))
        (mapcar #'(lambda (index row)
                (append
                    row
                    (list-of index 0)
                    (cons 1 nil)
                    (list-of (- n index 1) 0)))
            (list-for n) mat)))

;;; Выделяет присоедененную матрицу
(defun extract-mat (extmat)
    (let ((n (length extmat)))
        (mapcar #'(lambda (extrow)
                (subseq extrow n (* 2 n)))
            extmat)))

;;; Вспомогательная функция. Вычисляет следующую строку матрицы при прямом ходе
(defun calc-next-row (new-mat orig-mat)
    (let ((i (length new-mat))) ;; Индекс вычисляемой строки
        (append
            new-mat
            (list
                (mapcar #'(lambda (j)
                    (cond
                        ((> i j) 0)
                        ((= i j) 1)
                        (t (/
                            (reduce #'-
                                (mapcar #'(lambda (k)
                                    (* (mat-get orig-mat i k) (mat-get new-mat k j)))
                                    (list-for i))
                                :initial-value (mat-get orig-mat i j))
                            (reduce #'-
                                (mapcar #'(lambda (k)
                                    (* (mat-get orig-mat i k) (mat-get new-mat k i)))
                                    (list-for i))
                                :initial-value (mat-get orig-mat i i))))))
                    (list-for (length (first orig-mat))))))))

;;; Вспомогательная функция. Вычисляет следующую строку матрицы при обратном ходе
(defun calc-next-row-back (new-mat orig-mat)
    (let ((n (length orig-mat)) (i (- (length orig-mat) (length new-mat) 1))) ;; Индекс вычисляемой строки
        (append
            (list
                (mapcar #'(lambda (j)
                    (cond
                        ((= i j) 1)
                        ((< j n) 0)
                        (t (reduce #'-
                                (mapcar #'(lambda (k)
                                    (* (mat-get orig-mat i k) (mat-get new-mat (- k i 1) j)))
                                    (list-for n (+ i 1)))
                                :initial-value (mat-get orig-mat i j)))))
                    (list-for (length (first orig-mat)))))
            new-mat)))

;;; Вычисление обратной матрицы методом Гаусса
(defun inverse (mat)
    (if (matrixp mat)
        (let ((n (length mat)) (extmat (extend-mat mat)))
            (let ((extmat2
                ;;; Прямой ход
                (reduce #'calc-next-row
                    (list-of n extmat)
                    :initial-value nil)))
                (extract-mat
                    ;;; Обратный ход
                    (reduce #'calc-next-row-back
                        (list-of (- n 1) extmat2)
                        :initial-value (last extmat2)))))
        (error "object is not matrix")))
