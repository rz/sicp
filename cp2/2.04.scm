(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(car (cons 5 6)) ; 5
(car (cons 0 1)) ; 0

; cons is a procedure that returns a procedure. the returned procedure takes one
; argument which is itself a procedure and applies it to the arguments of cons.
; similarly, car is a procedure that takes a procedure as an argument and applies
; that procedure to a procedure which returns the first of its two arguments.  to
; understand how this works, use the substitution model:

; consider:
; (car (cons 5 6)) look up cons and substitute:
; (car (lambda (m) (m 5 6)))  look up car and substitute:
; ((lambda (m) (m 5 6)) (lambda (p q) p))  hard to read, but just (f g) and both f and g are procedures
; ((lambda (p q) p) 5 6)  a simple procedure of two arguments applied to two arguments
; 5

; we can define cdr similarly:

(define (cdr z)
  (z (lambda (p q) q)))

(car (cons 5 6)) ; 6
(car (cons 0 1)) ; 1

; cdr works the same way as car, but the procedure it returns is one that picks
; out the 2nd argument instead of the first. using  the substitution model:

; (cdr (cons 5 6)) look up cons and substitute:
; (cdr (lambda (m) (m 5 6)))  look up cdr and substitute:
; ((lambda (m) (m 5 6)) (lambda (p q) q))  (f g) where both f and g are procedures
; ((lambda (p q) q) 5 6)  a simple procedure of two arguments applied to two arguments
; 6

