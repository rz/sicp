(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (lg n base)
  ; (/ (log n) (log base))) ; would work but would return a float
  (define (iter x i)
    (if (<= x 1) i (iter (/ x base) (+ i 1))))
  (iter n 0))

(define (neq? a b) (not (= a b)))
(define (car n)
  (if (neq? (remainder n 3) 0) (lg n 2) (car (/ n 3))))

(define (cdr n)
  (if (neq? (remainder n 2) 0) (lg n 3) (cdr (/ n 2))))

(car (cons 18 19)) ; 18
(cdr (cons 18 19)) ; 19


; since car and cdr are so similar we can clean up a bit:
(define (pick x a b)
  (if (neq? (remainder x a) 0) (lg x b) (pick (/ x a) a b)))

(define (car n) (pick n 3 2))
(define (cdr n) (pick n 2 3))

(car (cons 18 19)) ; 18
(cdr (cons 18 19)) ; 19


; and we can also do without the log:
(define (count-even-divs n a)
  (define (iter x i)
    (if (neq? (remainder x a) 0) i (iter (/ x a) (+ i 1))))
  (iter n 0))

(define (car n) (count-even-divs n 2))
(define (cdr n) (count-even-divs n 3))

(car (cons 18 19)) ; 18
(cdr (cons 18 19)) ; 19

