(define (neq? a b)
  (not (= a b)))
(define (congruent? a b n)
  (= (remainder a n) (remainder b n)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
          (if (and (neq? base 1) (neq? base (- m 1)) (= (remainder (square base) m) 1))
            -1
            (remainder (square (expmod base (/ exp 2) m)) m)))
        (else
          (remainder (* base (expmod base (- exp 1) m)) m))))

(define (miller-rabin-test n)
  (define (test a)
    (if (= (expmod a (- n 1) n) -1)
      #f
      (congruent? (expmod a (- n 1) n) 1 n)))   ;;; technically we'd want (congruent? (expt a n) n) but that operation is slow, since expmod does the exponentiation and remainder operations at once and (a % b) % b = a % b, this works also
  (define (iterate a)
    (cond ((>= a n) #t)
          (else (and (test a) (iterate (+ a 1))))))
  (iterate 1))

(miller-rabin-test 3)      ;;; #t
(miller-rabin-test 4)      ;;; #f
(miller-rabin-test 5)      ;;; #t
(miller-rabin-test 13)     ;;; #t
(miller-rabin-test 15)     ;;; #f
(miller-rabin-test 17)     ;;; #t
(miller-rabin-test 561)    ;;; #f, first carmichael number doesn't fool it
(miller-rabin-test 41041)  ;;; #f, 2nd carmichael number doesn't fool it


