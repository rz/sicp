(defun good-enough?(guess x) (< (/ (abs (- (improve guess x) guess)) guess) 0.01))
(defun improve(guess x)  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))
(defun cube-root(x guess) (if (good-enough? guess x)
			      guess 
			      (cube-root x (improve guess x))))

