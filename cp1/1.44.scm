(define (smooth f)

  (define dx 0.0001)
  (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

(define (compose f g) (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter acc i)
    (if (= i n) acc (iter (compose acc f) (+ i 1))))
  (iter f 1))

(define (n-smooth f n)
  (repeated smooth n) f)


