(define (congruent? a b n)
  (= (remainder a n) (remainder b n)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (test a)
    (congruent? (expmod a n n) a n))   ;;; technically we'd want (congruent? (expt a n) n) but that operation is slow, since expmod does the exponentiation and remainder operations at once and (a % b) % b = a % b, this works also
  (define (iterate a)
    (cond ((>= a n) #t)
          (else (and (test a) (iterate (+ a 1))))))
  (iterate 1))

(fermat-test 3)      ;;; #t, 3 is prime
(fermat-test 4)      ;;; #f, 4 is prime
(fermat-test 5)      ;;; #t, 5 is prime
(fermat-test 15)     ;;; #f 15 isn't prime
(fermat-test 17)     ;;; #t 17 is prime
(fermat-test 561)    ;;; #t but 561 isn't prime, first carmichael number
(fermat-test 41041)  ;;; #t but 41041 isn't prime, 2nd carmichael number


