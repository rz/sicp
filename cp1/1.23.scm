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
  (display " runtime: ")
  (display elapsed-time))


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


(define (search-for-primes start search-size)
  (cond ((divides? 2 start) (search-for-primes (+ start 1) search-size))
        ((= search-size 0) #t)  ;;; we're done
        (else (timed-prime-test start) (search-for-primes (+ start 2) (- search-size 1)))))

(define (run-experiment e max-e size)
  (cond ((> e max-e) #t)
        (else (search-for-primes (expt 10.0 e) size)  ;;; 10.0 instead of 10 because i used 1eN syntax in the previous experiment, which represents a float, but (expt 10 N) would be an int and this changes timing results
              (display "\n\n")
              (run-experiment (+ e 1) max-e size))))

(run-experiment 8 11 100)

;;; The following runtimes are shown:
;;;  1e8: 2e-2 - 3e-2
;;;  1e9: 0.07 - 0.08
;;; 1e10: 0.22 - 0.23
;;; 1e11: 0.70 - 0.71
;;;
;;; Comparing those with the ones from the experiment from exercise 1.22, we see that indeed,
;;; removing the pointless checks for multiples of 2 does decrease the runtime, but it isn't
;;; a factor of 2, but by ~1.85. This may be due to the fact that we replaced a native operation
;;; (+ 1 n) with a user defined one, which introduces overhead.
;;;
;;; Also note that there is an even better optimization to make: avoid checking for all the
;;; multiples of a given number after it has been checked. ie check for 3, but not for 6, 9, 12,...


