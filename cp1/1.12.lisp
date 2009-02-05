(defun pascal(n k)
  (cond ((= k 0) 1)
	((<= n k) 1)
	(t (+ (pascal (- n 1) (- k 1)) (pascal (- n 1) k)))))