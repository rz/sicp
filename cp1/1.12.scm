;;;     0 1 2 3 4
;;;   +-----------
;;; 0 | 1
;;; 1 | 1 1
;;; 2 | 1 2 1
;;; 3 | 1 3 3 1
;;; 4 | 1 4 6 4 1

(define (pascal i j)
  (cond ((= j 0) 1)
        ((= i j) 1)
        (else (+ (pascal (- i 1) j) (pascal (- i 1) (- j 1))))))

