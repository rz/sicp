(define (good-enough? x guess)
  (< (abs (- (* guess guess guess) x)) (/ x 10000)))

(define (improve-guess x guess)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (cube-root-iter x guess)
  (if (good-enough? x guess)
    guess
    (cube-root-iter x (improve-guess x guess))))

(define (cube-root x)
  (cube-root-iter x 1.0))

