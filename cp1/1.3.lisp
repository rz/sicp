;;in clisp
(defun f(a b c) 
  (cond ((and (< c b) (< c a)) (+ (* a a) (* b b)))
	((and (< a b) (< a c)) (+ (* b b) (* c c)))
	(t (+ (* a a) (* c c)))))
