;;; this is the recursive version in the book
;;; (define (fast-expt b n)
;;;  (cond ((= n 0) 1)
;;;        ((even? n) (square (fast-expt b (/ n 2))))
;;;        (else (* b (fast-expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))

(define (square n)
  (* n n))


;;; iterative version
(define (fast-expt-iter b n aux)
  (cond ((= n 0) 1)
        ((= n 1) (* b aux))
        ((even? n) (fast-expt-iter (square b) (/ n 2) aux))
        (else (fast-expt-iter b (- n 1) (* b aux)))))

(define (fast-expt b n)
  (fast-expt-iter b n 1))

