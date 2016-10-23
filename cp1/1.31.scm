(define (product term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* result (term a)))))
  (iter a 1))

(define (identity x) x)
(define (inc x) (+ x 1))
(define (factorial n) (product identity 1 inc n))

(define (inc2 x) (+ x 2))
(define (pi n) (* 8.0 n (/ (product square 4 inc2 (- n 1)) (product square 3 inc2 n))))

