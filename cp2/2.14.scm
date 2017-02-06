(load "cp2/2.07.scm")
(load "cp2/2.08.scm")
(load "cp2/2.10.scm")
(load "cp2/2.11.scm")
(load "cp2/2.12.scm")

;;; verifying Lem's claims:
(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))
(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))


(let
  ((r1 (make-interval 5 6)) (r2 (make-interval 2 4)))
    (display (par1 r1 r2)) (newline)
    (display (par2 r1 r2)) (newline))

;;; outputs:
;;; (1. . 3.4285714285714284)
;;; (1.4285714285714286 . 2.4000000000000004)
;;; so, Lem is right, there is something wrong


(define r1 (make-center-percent 25 0.01))
(define r2 (make-center-percent 50 0.02))
(let
  ((d (div-interval r1 r1)))
    (display (center d)) (newline) (display (percent d)) (newline))
;;; outputs:
;;; 1.000200020002
;;; 1.9998000199980024e-2

(let
  ((d (div-interval r1 r2)))
    (display (center d)) (newline) (display (percent d)) (newline))
;;; outputs:
;;; .5003001200480192
;;; 2.9994001199760017e-2

;;; r1/r1 is not 1!
;;; Lem is definitely on to something.

