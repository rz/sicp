(define (iterative-improve good-enough? improve)
  (define (iter guess)
    (if (good-enough? guess) guess (iter (improve guess))))
  iter)

(define (average x y) (/ (+ x y) 2))

(define (sqrt x)
  (define (ge? guess) (< (abs (- (square guess) x)) 0.001))
  (define (imp guess) (average guess (/ x guess)))
  ((iterative-improve ge? imp) 1.0))


(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (ge? guess) (< (abs (- (f guess) guess)) tolerance))
  (define (imp guess) (f guess))
  ((iterative-improve ge? imp) first-guess))

