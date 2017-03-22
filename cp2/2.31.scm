(define (tree-map fxn tree)
  (map
    (lambda (t) (if (pair? t) (tree-map fxn t) (fxn t)))
    tree))

(define (square-tree tree) (tree-map square tree))


