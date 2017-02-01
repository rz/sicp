(load "cp2/2.07.scm") ;; for constructors and selectors

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))


(define (make-center-percent c p)
  ;; p should be between 0.0 and 1.0, if this were real i'd enforce/warn here
  (make-interval-center-width c (* c p)))

(define (percent i)
  (/ (width i) (center i)))

