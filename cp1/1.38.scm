(define (i-cont-frac n-term d-term k)
  (define (iter i result)
    (if (= i 0)
      result
      (iter (- i 1) (/ (n-term i) (+ result (d-term i))))))
  (iter k 1))

(define (e-frac k)
  (define (e-d-term i)
    (if (= (remainder i 3) 2) (* 2 (+ (quotient i 3) 1)) 1))
  (+ 2.0 (i-cont-frac (lambda (i) 1) e-d-term k)))

(e-frac 10) ;; 2.7182817182817183

