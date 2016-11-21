(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; note that zero is a procedure that takes a procedure and returns a procedure of one argument
; the returned procedure is just the identity function, ie it applies its argument zero times
; by analogy, we can guess that (add-1 zero) -> one should be a procedure that takes a procedure
; as argument and returns a procedure of one argument. the returned procedure should apply the
; passed procedure one time ie:
(define one (lambda (f) (lambda (x) (f x))))

; and, similarly two:
(define two (lambda (f) (lambda (x) (f (f x)))))

; let's verify that this is what we obtain when we apply add-1 to zero:

(add-1 zero) ; look up body of add-1, substituting zero for n
(lambda (f) (lambda (x) (f ((zero f) x)))) ; look up zero, using f for its F so it's easier to keep track:
(lambda (f) (lambda (x) (f (
                             (lambda (F) (lambda (x) x) f) ; <-- (zero f)
                          x))))

; we can evaluate the (zero f) part:
(lambda (f) (lambda (x) (f (
                             (lambda (x) x) ; <-- happpens bc zero applies its argument zero times ie ignores it
                          x))))

; re-writing to stay organized:
(lambda (f) (lambda (x) (f
                           ((lambda (x) x) x) ; <-- this is the identity applied to x
               )))
; so, we have:
(lambda (f) (lambda (x) (f x)))
; which matches what we expected for one

; addition takes 2 arguments, which are themselves procedures of 1-argument that apply their arguments
; m and n times respectively, and returns a procedure that applies its argument m+n times.

(define (add m n)
  (lambda (f) (lambda (x) ((m f) ((n f) x)))))

; this works in an analogous way to add-1, which simply wraps the result of applying n to f in another
; application of f. add wraps the application n to f in a function that applies f m times.

