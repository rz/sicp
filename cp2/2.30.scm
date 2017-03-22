;;; just recursion
(define (sq-tree-rec tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (square tree))
        (else (cons (sq-tree-rec (car tree)) (sq-tree-rec (cdr tree))))))


;;; map-recurse
(define (sq-tree tree)
  (map
    (lambda (t) (if (pair? t) (sq-tree t) (square t)))
    tree))
