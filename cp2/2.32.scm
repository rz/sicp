(define (subsets s)
  (if (null? s)
    (list '())
    (let ((rest (subsets (cdr s))))
      (display rest) (newline)
      (append rest (map (lambda (x) (cons (car s) x)) rest)))))

; to see why it works, consider the case of a list with a single element. (1)
; we know that (subsets ()) is (()) and that (cdr s) is (), so rest will be (()).
; to generate the subsets, we generate a list of with the elements of rest with the
; first element of the list "prepended" to them. in the case of (1) this list would be
; "prepending" 1 to () ie (1). we then append that list to rest ie (() (1))

