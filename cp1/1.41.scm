(define (double f) (lambda (x) (f (f x))))

((double inc) 3) ; 5
(((double (double double)) inc) 5) ; 21

;;; i was expecting it to be 13 thinking (double (double double)) returns the
;;; given procedure 8 times: double double -> 4, double (double double) -> 8
;;; that's incorrect, though, (double (double double)) is a procedure that
;;; doubles (double double) i.e. (((double double) ((double double) f)) x).
;;; since ((double double) f) is (f (f (f (f x)))) we have that the last
;;; expression is ((double double) (f (f (f (f x))))) which is 4 applications
;;; of f applied 4 times ie 16 applications of f.

