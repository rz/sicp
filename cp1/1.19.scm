;;; T(a, b) -> a+b, a
;;; T(1, 0) -> 1+0, 1; T(1, 1) -> 2, 1; T(2, 1) -> 3, 2
;;;                    T^2(1, 0)          T^3(1, 0)
;;;
;;; T^n(1, 0) -> Fib(n+1), Fib(n)
;;;
;;; Tpq(a, b) -> bq + aq + ap, bp + aq
;;;
;;; ie the T for fib is the case p=0, q=1
;;;
;;; NTS: Tpq^2(a, b), it is the same as Trs(a, b) -> bs + as + ar, br + as; compute r and s in terms of p and q
;;;
;;; Tpq(a, b) = bq+aq+ap, bp+aq
;;; Tpq^2(a, b) = T(bq+aq+ap, bp+aq) = (bp+aq)q + (bq+aq+ap)q + (bq+aq+ap)p, (bp+aq)p+(bq+aq+ap)q
;;;             = bpq + aq^2 + bq^2 + aq^2 + apq + bqp + aqp + ap^2, bp^2 + aqp + bq^2 + aq^2 + apq
;;;
;;; it is easier to figure out how to factor things using the 2nd term, so do that first:
;;;
;;; bp^2 + aqp + bq^2 + aq^2 + apq = b(p^2+q^2) + a(q^2 + 2pq)
;;;
;;; this suggests that r=(p^2+q^2) and s=(q^2 + 2pq), does the first time factor into the right form?
;;;
;;; bpq + aq^2 + bq^2 + aq^2 + apq + bqp + aqp + ap^2 = b(q^2 + 2pq) + a(p^2 + q^2) + a(q^2 + 2qp)
;;;                                                   = br + ar + as
;;;
;;; so, yes, the 1st term factors the same way and r=(p^2+q^2), s=(q^2 + 2pq)
;;; and to convert to the notation of the book p' = r and q' = s

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q)) ; compute p' ie r
                   (+ (* q q) (* 2 p q)) ; compute q' ie s
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))


