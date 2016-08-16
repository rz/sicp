;;; original
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


;;; have tolerance in good-enough depend on x
(define (good-enough2? x guess)
  (< (abs (- (* guess guess) x)) (/ x 10000)))

(define (sqrt-iter2 x guess)
  (if (good-enough2? x guess)
    guess
    (sqrt-iter2 x (improve-guess x guess))))

(define (sqrt3 x)
  (sqrt-iter2 x 1.0))


;;; have good-enough operate on the difference between guesses
(define (good-enough3? x guess prev-guess)
  (< (abs (- guess prev-guess)) 0.0001))

(define (sqrt-iter3 x guess prev-guess)
  (if (good-enough3? x guess prev-guess)
    guess
    (sqrt-iter3 x (improve-guess x guess) guess)))

(define (sqrt4 x)
  (sqrt-iter3 x 1.0 0.5))

