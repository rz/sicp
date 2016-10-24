(define (filtered-accumulate combiner filter null-value term a next b)
  (if (> a b)
    null-value
    (combiner (if (filter a) (term a) null-value)
              (filtered-accumulate combiner filter null-value term (next a) next b))))



(define (divides? a b)
  (= (remainder b a) 0))
(define (next n)
  (if (= n 2) 3 (+ n 2)))
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
(define (prime? n)
  (= n (smallest-divisor n)))


(define (id x) x)
(define (inc x) (+ x 1))

(define (prime-sum a b)
  (filtered-accumulate + prime? 0 id a inc b))


(define (gcd a b)
  (if (= b 0) a (gcd b (remainder a b))))

(define (relative-prime? a b) (= (gcd a b) 1))

(define (relative-prime-sum n)
  (define (rel-prime-n? x) (relative-prime? x n))
  (filtered-accumulate + rel-prime-n? 0 id 1 inc n))

