(define (good-enough? x guess)
  (< (abs (- (* guess guess) x)) 0.0001))

(define (improve-guess x guess)
  (/ (+ (/ x guess) guess) 2))

(define (sqrt-iter x guess)
  (if (good-enough? x guess)
    guess
    (sqrt-iter x (improve-guess x guess))))

(define (sqrt2 x)
  (sqrt-iter x 1.0))

