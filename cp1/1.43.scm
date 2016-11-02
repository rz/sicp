(define (repeated f n)
  (define (iter acc i)
    (if (= i n) acc (iter (lambda (x) (acc (f x))) (+ i 1))))
  (iter f 1))

((repeated square 2) 5) ; 625

;;; using compose from 1.42:

(define (compose f g) (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter acc i)
    (if (= i n) acc (iter (compose acc f) (+ i 1))))
  (iter f 1))

((repeated square 2) 5) ; 625

