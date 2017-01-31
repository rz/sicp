(load "cp2/2.07.scm") ; for constructors and selectors

;;; original implementation requires 4 products:
;;;  (define (mul-interval x y)
;;;    (let ((p1 (* (lower-bound x) (lower-bound y)))
;;;          (p2 (* (lower-bound x) (upper-bound y)))
;;;          (p3 (* (upper-bound x) (lower-bound y)))
;;;          (p4 (* (upper-bound x) (upper-bound y))))
;;;      (make-interval (min p1 p2 p3 p4)
;;;                     (max p1 p2 p3 p4))))

;;; the 9 out of the 16 possible cases are the ones that don't contain an
;;; interval whose lower bound is a positive and upper bound is a negative
;;; number i.e. the ones that don't make sense, like [5, -3]:
;;;
;;; + + + +
;;; + + + - NO
;;; + + - +
;;; + + - -
;;; + - + + NO
;;; + - + - NO
;;; + - - + NO
;;; + - - - NO
;;;
;;; - + + +
;;; - + + - NO
;;; - + - +
;;; - + - -
;;; - - + +
;;; - - + - NO
;;; - - - +
;;; - - - -

(define (pos? x) (if (>= x 0) #t #f))
(define (neg? x) (not (pos? x)))

(define (mul-interval x y)
  (let ((xl (lower-bound x)) (xu (upper-bound x))
        (yl (lower-bound y)) (yu (upper-bound y)))
    (cond
      ((and (pos? xl) (pos? xu) (pos? yl) (pos? yu)) (make-interval (* xl yl) (* xu yu)))
      ((and (pos? xl) (pos? xu) (neg? yl) (pos? yu)) (make-interval (* xu yl) (* xu yu)))
      ((and (pos? xl) (pos? xu) (neg? yl) (neg? yu)) (make-interval (* xu yl) (* xl yu)))
      ((and (neg? xl) (pos? xu) (pos? yl) (pos? yu)) (make-interval (* xl yu) (* xu yu)))

      ((and (neg? xl) (pos? xu) (neg? yl) (pos? yu))
        (let ((pl1 (* xl yu)) (pl2 (* xu yl)) (pu1 (* xu yu)) (pu2 (* xl yl)))
          (make-interval (min pl1 pl2) (max pu1 pu2))))

      ((and (neg? xl) (pos? xu) (neg? yl) (neg? yu)) (make-interval (* xu yl) (* xl yl)))
      ((and (neg? xl) (neg? xu) (pos? yl) (pos? yu)) (make-interval (* xl yu) (* xu yl)))

      ((and (neg? xl) (neg? xu) (neg? yl) (pos? yu)) (make-interval (* xl yu) (* xl yl)))
      ((and (neg? xl) (neg? xu) (neg? yl) (neg? yu)) (make-interval (* xu xu) (* xl yl))))))


;;; test cases
(define a (make-interval 2 4))
(define b (make-interval -2 4))
(define c (make-interval -4 -2))
(display (mul-interval a a)) (newline)
(display (mul-interval a b)) (newline)
(display (mul-interval a c)) (newline)
(display (mul-interval b a)) (newline)
(display (mul-interval b b)) (newline)
(display (mul-interval b c)) (newline)
(display (mul-interval c a)) (newline)
(display (mul-interval c b)) (newline)
(display (mul-interval c c)) (newline)

;;; outputs:
;;; (4 . 16)
;;; (-8 . 16)
;;; (-16 . -4)
;;; (-8 . 16)
;;; (-8 . 16)
;;; (-16 . 8)
;;; (-16 . -4)
;;; (-16 . 8)
;;; (4 . 16)

