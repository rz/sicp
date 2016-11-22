; to implement subtraction we should define the notion of the additive-inverse of
; an interval. if an interval is (a b) with both a and b positive, then its
; additive inverse is (-b -a) (because -b is "more negative" than -a).
; (- (a b)) -> (-b -a) works in general.
; then, subtracting two intervals is adding the additive-inverse of the 2nd to the 1st.

(load "cp2/2.07.scm") ; for the constructors and selectors

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (let ((negy (make-interval (- (upper-bound y)) (- (lower-bound y)))))
    (add-interval x negy)))

