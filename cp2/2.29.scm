(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

; a.
(define left-branch car)
(define right-branch cadr)
(define branch-length car)
(define branch-structure cadr)

; b.
(define (total-weight mobile)
    (+ (branch-weight (left-branch mobile)) (branch-weight (right-branch mobile))))

(define (branch-weight branch)
  (let ((structure (branch-structure branch)))
    (if (pair? structure) (total-weight structure) structure)))

; c.
(define (balanced? mobile)
  (=
    (* (branch-length (left-branch mobile)) (branch-weight (left-branch mobile)))
    (* (branch-length (right-branch mobile)) (branch-weight (right-branch mobile)))))


(define a (make-mobile (make-branch 2 3) (make-branch 2 3)))
(define b (make-mobile (make-branch 2 3) (make-branch 4 5)))

(left-branch a)  ; returns (2 3)
(right-branch b) ; returns (4 5)

(branch-length (left-branch b)) ; returns 2
(branch-length (right-branch b)) ; returns 4

(branch-structure (left-branch b)) ; returns 3
(branch-structure (right-branch b)) ; returns 5

(total-weight a) ; returns 6
(total-weight b) ; returns 8

(balanced? a)  ; returns #t
(balanced? b)  ; returns #f


; d.
; if we changed the constructors to:

; (define (make-mobile left right)
;   (cons left right))
; (define (make-branch length structure)
;   (cons length structure))

; all we'd need to change above are the selectors defined in part a, to:

; (define left-branch car)
; (define right-branch cdr)
; (define branch-length car)
; (define branch-structure cdr)
