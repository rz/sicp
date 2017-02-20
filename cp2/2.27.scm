(load "cp2/2.18.scm")

(define (flat? items)
  (reduce (lambda (x y) (and x y)) #t
    (map (lambda (x) (not (pair? x))) items)))

(define (deep-reverse items)
  (cond
    ((null? items) items)
    ((flat? items) (reverse items))
    (else (reverse (cons (deep-reverse (car items)) (deep-reverse (cdr items)))))))

