(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) '() sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))

(map square '(1 2 3 4)) ; returns (1 4 9 16)
(append '(1 2 3) '(4 5 6)) ; returns (1 2 3 4 5 6)
(length '(1 2 3 4)) ; returns 4
