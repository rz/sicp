(defun fr(n)
  (if (<= n 3)
      n
      (+ (fr (- n 1)) (* 2 (fr (- n 2))) (* 3 (fr (- n 3))))))


;; f/c  6 5 4 3
;; f(1) x
;; f(2) y x
;; f(3) z y x
;; f(4)   z y x
;; f(5)     z y
;; f(6)       z

(defun fi(n)
  (defun iter(x y z c)
    (if (= c 3)
	z
	(iter y z (+ z (* 2 y) (* 3 x)) (- c 1))))
  (iter 1 2 3 n))


