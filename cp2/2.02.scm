(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (make-segment p1 p2) (cons p1 p2))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))

(define (midpoint-segment s)
  (make-point
    (/ (+ (x-point (start-segment s)) (x-point (end-segment s))) 2)
    (/ (+ (y-point (start-segment s)) (y-point (end-segment s))) 2)))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define a (make-point -1 2))
(define b (make-point 3 -6))
(define s (make-segment a b))
(define m (midpoint-segment s))
(print-point m) ;; (1, -2)
