(load "cp2/2.02.scm")

; let's start with the simplest implementation of perimeter and area
(define (perimeter r)
  (+ (* 2 (width r)) (* 2 (height r))))

(define (area r)
  (* (width r) (height r)))

; so long we have width and height procedures that work, this implementation
; of area and perimeter will work. those procedures, however, will deppend on
; how rectangles are represented

; arguments to the constructor are expected to be points
; represeting top left and bottom right corners
(define (make-rect tl br) (cons (tl br)))
(define (tl-rect r) (car r))
(define (tr-rect r) (make-point (x-point (br-rect r) (y-point (tl-rect r))))) ; for completeness, we don't need this for area and perimeter
(define (bl-rect r) (make-point (x-point (tl-rect r) (y-point (br-rect r))))) ; also for completeness, we don't need it
(define (br-rect r) (cdr r))

(define (width r) (abs (- (x-point (tl-rect r)) (x-point (tr-rect r)))))
(define (height r) (abs (- (y-point (tl-rect r)) (y-point (bl-rect r)))))



; we can implement make-rect in a different way and as long as we have
; height and width procedures, area and perimeter will continue to work.
(define (make-rect bl w h) (cons bl (cons (w h))))

; the 4 selectors for the corners are here just for completeness, they are not
; needed for area and perimeter
(define (tl-rect r) (make-point (x-point (bl-rect r)) (+ (y-point (bl-rect r) (height r)))))
(define (tr-rect r) (make-point (+ (x-point (bl-rect r)) (width r)) (+ (y-point (bl-rect r)) (height r))))
(define (br-rect r) (make-point (+ (x-point (bl-rect r)) (width r)) (y-point (bl-rect r))))
(define (bl-rect r) (car r))

(define (width r) (car (cdr r)))
(define (height r) (cdr (cdr r)))



