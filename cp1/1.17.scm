(define (double n) (+ n n))
(define (halve n) (/ n 2)) ; it'd be cool to do this without division, to stay in the spirit of the exercise but it doesn't seem too worthwhile to figure out how.
(define (even? n) (= (remainder n 2) 0))

(define (mult a b)
  (cond ((or (= a 0) (= b 0)) 0)
        ((< b 0) (mult (- a) (- b)))
        ((= b 1) a)
        ((even? b) (double (mult a (halve b))))
        (else (+ a (mult a (- b 1))))))


