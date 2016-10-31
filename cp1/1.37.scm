(define (r-cont-frac n-term d-term k)
  (if (= k 0)
    (/ (n-term k) (d-term k))
    (/ (n-term k) (+ (d-term k) (r-cont-frac n-term d-term (- k 1))))))


(r-cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 10) ; .6180555555555556
(r-cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 11) ; .6180257510729613


(define (i-cont-frac n-term d-term k)
  (define (iter i result)
    (if (= i 0)
      result
      (iter (- i 1) (/ (n-term i) (+ result (d-term i))))))
  (iter k 1))


(i-cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 11) ; .6180257510729613

