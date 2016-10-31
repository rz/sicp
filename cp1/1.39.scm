(define (i-cont-frac n-term d-term k)
  (define (iter i result)
    (if (= i 0)
      result
      (iter (- i 1) (/ (n-term i) (+ result (d-term i))))))
  (iter k 1))

(define (tan-cf x k)
  (define (d i) (- (* 2 i) 1))
  (define (n i) (if (= i 1) x (- (square x))))
  (i-cont-frac n d k))

(define pi 3.1415)
(- (tan (/ pi 4)) (tan-cf (/ pi 4) 10)) ; 1.1102230246251565e-16
(- (tan (/ pi 6)) (tan-cf (/ pi 6) 10)) ; 0.

