;; avoid loading 2.36 bc it deppends on 2.33, which defines map to only take 2 arguments.
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))


(define (display-matrix m)
  (map (lambda (r) (display r) (newline)) m)
  (newline))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product row v)) m))
(define (transpose mat)
  (accumulate-n cons () mat))
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (r) (map (lambda (c) (dot-product r c)) cols)) m)))



(define m (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
(define n (list (list 1 2 3) (list 1 2 3) (list 1 2 3) (list 1 2 3)))
(define v1 (list 1 0 0))
(define v2 (list 0 1 0))
(define v3 (list 0 0 1))

(newline)
(display-matrix m)
(display-matrix n)

(display (matrix-*-vector m v1)) (newline)
(display (matrix-*-vector m v2)) (newline)
(display (matrix-*-vector m v3)) (newline)
(newline)

(display-matrix (transpose n)) (newline)
(display-matrix (matrix-*-matrix m n)) (newline)
