(defun halve(a) (/ a 2))
(defun double(a) (+ a a))
(defun even?(n) (= (mod n 2) 0))

(defun mult(a b)
  (cond ((= b 0) 0)
	((even? b) (mult (double a) (halve b)))
	(t (+ a (mult a (- b 1))))))
	
