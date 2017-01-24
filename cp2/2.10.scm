(load "cp2/2.07.scm") ; for the constructors and selectors

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))


(define (spans0? x)
  (or (and (<= (lower-bound x) 0) (>= (upper-bound x) 0))
      (= (lower-bound x) 0)
      (= (upper-bound x) 0)))


(define (div-interval x y)
  (if (spans0? y)
    (error "Error: denominator spans 0!")
    (mul-interval x
                  (make-interval (/ 1.0 (upper-bound y))
                                 (/ 1.0 (lower-bound y))))))
