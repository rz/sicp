(load "cp2/2.33.scm") ; for definition of accumulate

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms) (+ this-coeff (* higher-terms x)))
              0
              coefficient-sequence))

(horner-eval 2 (list 1 3 0 5 0 1)) ; returns 79

