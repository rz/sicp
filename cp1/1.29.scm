;;; simpson's rule:
;;; h/3 [y0 + 4y1 + 2y2 + 4y3 + ...+ 2yn-2 + 4yn-1 + 4yn]

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (inc k) (+ k 1))
  (define (term k)
    (define (y k) (f (+ a (* k h))))
    (cond ((= k 0) (y 0))
          ((= k n) (y n))
          ((even? k) (* 2 (y k)))
          ((odd? k) (* 4 (y k)))))
  (/ (* h (sum term 0 inc n)) 3))


(define (cube x) (* x x x))

(simpson cube 0 1 100)  ;;; -> 1/4
(simpson cube 0 1 1000) ;;; -> 1/4

;;; clearly, the simpson procedure provides a better approximation than the procedure defined in the text

