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


;;; with fixed-point finding and average damping made explicit, section 1.4
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define (average x y) (/ (+ x y) 2))
(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (sqrt5 x)
  (fixed-point (average-damp (lambda (y) (/ x y))) 1.0))


;;; with newton's method made explicit
(define dx 0.00001)
(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))

(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))
(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))
(define (sqrt6 x)
  (newtons-method (lambda (y) (- (square y) x)) 1.0))

