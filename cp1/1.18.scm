(define (double n) (+ n n))
(define (halve n) (/ n 2))
(define (even? n) (= (remainder n 2) 0))

;;; iterative version
(define (mult a b)
  (define (mult-iter a b aux)
    (cond ((or (= a 0) (= b 0)) 0)
          ((< b 0) (mult (- a) (- b)))
          ((= b 1) (+ a aux))
          ((even? b) (mult-iter (double a) (halve b) aux))
          (else (mult-iter a (- b 1) (+ a aux)))))
  (mult-iter a b 0))

