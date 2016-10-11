;;; timed-prime-test is modified slightly from what's given in the text
;;; to make it only print output when the number in question is prime
(define (timed-prime-test n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (fast-prime? n 100)
      (report-prime n (- (runtime) start-time))))
(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " runtime: ")
  (display elapsed-time))

(define (divides? a b)
  (= (remainder b a) 0))
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (search-for-primes start search-size)
  (cond ((divides? 2 start) (search-for-primes (+ start 1) search-size))
        ((= search-size 0) #t)  ;;; we're done
        (else (timed-prime-test start) (search-for-primes (+ start 2) (- search-size 1)))))

(define (run-experiment e max-e step size)
  (cond ((> e max-e) #t)
        (else (search-for-primes (expt 10 e) size)
              (display "\n\n")
              (run-experiment (+ e step) max-e step size))))

(run-experiment 8 11 1 100)

;;; timing results:
;;;  1e8: 0.01
;;;  1e9: 0.01
;;; 1e10: 0.01
;;; 1e11: 0.01
;;; this suggests that in order to actually see the timing difference we need to try larger numbers:

(run-experiment 200 225 5 1000)

;;; 1e200: 0.46
;;; 1e205: 0.49 - 0.51
;;; 1e210: 0.54
;;; 1e215: 0.56
;;; 1e220: 0.57 - 0.59
;;; 1e225: 0.65
;;; since our input is growing exponentially and the algorithm is O(log N) we expect that the time grows linearly with input size.
;;; the data bears this, the time grows by a factor of ~1.03 - 1.14 at each step.

