(define (make-rat n d)
  (if (< d 0)
    (make-rat (- n) (- d))
    (let ((g (gcd n d))) (cons (/ n g) (/ d g)))))

(define (numer r) (car r))
(define (denom r) (cdr r))

