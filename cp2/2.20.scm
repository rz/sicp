(define (same-parity x . l)
  (let ((parity-f (if (even? x) even? odd?)))
    (cons x (filter parity-f l))))


;;; i cheated by using filter, but filter is easy to write:

(define (filter fxn items)
  (if (null? items) items
    (let ((filtered-tail (filter fxn (cdr items))))
      (if (fxn (car items)) (cons (car items) filtered-tail) filtered-tail))))

