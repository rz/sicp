;;; f(n) = n if n < 3 and f(n) = f(n-1) + 2 f(n-2) + 3 f(n-3) otherwise

;;; recursive
(define (fR n)
  (if (< n 3) n (+ (fR (- n 1)) (* 2 (fR (- n 2))) (* 3 (fR (- n 3))))))


;;; iterative
;;; idea is the same as the method in the book to compute fib, but this time with 4 state variables
;;; a, b, c, i initialized as a=2 ie f(2), b=1 ie f(1), c=0 ie f(0), and i=n which will be a counter
;;; a <- a + 2*b + 3*c
;;; b <- a
;;; c <- b
;;; i <- i - 1

(define (f-iter a b c i)
  (if (= i 0) c
    (f-iter (+ a (* 2 b) (* 3 c)) a b (- i 1))))
(define (fI n)
  (f-iter 2 1 0 n))


