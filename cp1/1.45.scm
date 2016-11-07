(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define (average x y) (/ (+ x y) 2))
(define (average-damp f)
  (lambda (x) (average x (f x))))


(define (compose f g) (lambda (x) (f (g x))))
(define (repeated f n)
  (define (iter acc i)
    (if (= i n) acc (iter (compose acc f) (+ i 1))))
  (iter f 1))


(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (* y y)))) 1.0))

(define (fourth-root x)
  (fixed-point (average-damp (average-damp (lambda (y) (/ x (* y y y))))) 1.0))

(define (fifth-root x)
  (fixed-point ((repeated average-damp 2) (lambda (y) (/ x (expt y 4)))) 1.0))

(define (sixth-root x)
  (fixed-point ((repeated average-damp 2) (lambda (y) (/ x (expt y 5)))) 1.0))

(define (root x n)
  (fixed-point ((repeated average-damp 2) (lambda (y) (/ x (expt y (- n 1))))) 1.0))

;;; the above version of the n-th root works up to n=7
;;; n=2,3 -> 1 avg damp
;;; n=4,5,6,7 -> 2 avg damp

(define (root x n)
  (fixed-point ((repeated average-damp 3) (lambda (y) (/ x (expt y (- n 1))))) 1.0))

;;; and with 3 applications of average-damp as in the latest version, it works up to n=15
;;; this suggests that we need log2 n applications of average damp

(define (log2 n) (floor->exact (/ (log n) (log 2))))

(define (root x n)
  (fixed-point ((repeated average-damp (log2 n)) (lambda (y) (/ x (expt y (- n 1))))) 1.0))

(root (expt 2 18) 18) ; 2.0000005848426476
(root (expt 89 87) 87) ; 88.99999791482249
(root (expt 1089 87) 87) ; 1089.0000010655783

;;; something goes wrong (overflow?) with floor->exact when trying larger numbers eg:
(root (expt 11089 87) 87) ; <big number> passed as the first argument to integer->flonum, is not in the correct range.

