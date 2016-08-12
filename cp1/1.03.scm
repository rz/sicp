;;; Define a procedure that takes 3 argumens, returns the sum of the squares of the largest 2 numbers.

(define (fxn a b c)
  (cond ((and (< c a) (< c b)) (+ (* a a) (* b b)))
        ((and (< b a) (< b c)) (+ (* a a) (* c c)))
        ((and (< a b) (< a c)) (+ (* b b) (* c c)))
))

;;; ugly! let's make it more readable

(define (square x) (* x x))
(define (sum-squares x y) (+ (square x) (square y)))
(define (min a b c)
  (cond ((and (< c a) (< c b)) c)
        ((and (< b a) (< b c)) b)
        ((and (< a b) (< a c)) a)
))

(define (fxn a b c)
  (cond ((= (min a b c) a) (sum-squares b c))
        ((= (min a b c) b) (sum-squares a c))
        ((= (min a b c) c) (sum-squares a b))
))

