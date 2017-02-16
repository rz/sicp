(define (for-each fxn items)
  (cond ((null? items) #t)
        (else
          (fxn (car items))
          (for-each fxn (cdr items)))))

