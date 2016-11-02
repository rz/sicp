(define dx 0.00001)
(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))
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
(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))
(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (cube x) (* x x x))
(define (p3 a b c x) (+ (cube x) (* a (square x)) (* b x) c))
(define (cubic a b c) (lambda (x) (p3 a b c x)))

(newtons-method (cubic 2 3 4) 1) ; -1.6506291914330982, and wolfram alpha gives: -1.65062919143938821888...

