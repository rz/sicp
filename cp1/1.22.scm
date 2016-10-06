;;; timed-prime-test is modified slightly from what's given in the text
;;; to make it only print output when the number in question is prime
(define (timed-prime-test n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))))
(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))


(define (search-for-primes start search-size)
  (cond ((divides? 2 start) (search-for-primes (+ start 1) search-size))
        ((= search-size 0) #t)  ;;; we're done
        (else (timed-prime-test start) (search-for-primes (+ start 2) (- search-size 1)))))


(search-for-primes 1e3 100)
(newline)(newline) ;;; prints 1009, 1013 and 1019 for the smallest 3 primes; the runtime is 0! the text is not up to speed with out current processors :)
(search-for-primes 1e4 100)
(newline)(newline) ;;; primes: 10007, 10009, 10037; runtime: 0
(search-for-primes 1e5 100)
(newline)(newline) ;;; primes: 100003, 100019, 100043; runtime: 0
(search-for-primes 1e6 100)
(newline)(newline) ;;; primes 1000003, 1000033, 1000037;
(search-for-primes 1e7 100)
(newline)(newline) ;;; primes: 10000019, 10000079, 10000103; runtime: 0
(search-for-primes 1e8 100)
(newline)(newline) ;;; primes: 100000007, 100000037, 100000039; runtime: 4e-2 - 5e-2
(search-for-primes 1e9 100)
(newline)(newline) ;;; primes: 1000000007, 1000000009, 1000000021; runtime: 0.13 - 0.15
(search-for-primes 1e10 100)
(newline)(newline) ;;; primes: 10000000019, 10000000033, 10000000061; runtime: 0.42
(search-for-primes 1e11 100)
(newline)(newline) ;;; primes: 100000000003, 100000000019, 100000000057; runtime: 1.32 - 1.47

;;; The square root of 10 is ~3.16, so we expect that the runtimes grow by that amount at each trial
;;; which is what happens (approximately): 0.04 x 3.16 = 0.13, 0.13 x 3.16 = 0.41, 0.42 x 3.16 = 1.32.
;;; The result is compatible with programs run in time proportional to the number of steps required
;;  for the computation.

