(load "cp2/2.33.scm") ; for definition of accumulate

(define (count-leaves t)
  (accumulate +
              0
              (map (lambda (e) (if (pair? e) (count-leaves e) 1)) t)))

(define x (cons (list 1 2) (list 3 4)))
(define y (list x x))

(count-leaves x) ; returns 4
(count-leaves y) ; returns 8
