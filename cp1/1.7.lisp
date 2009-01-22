;; the original
(defun good-enough?(guess x) (< (abs (- (* guess guess) x)) 0.001))
(defun average(x y) (/ (+ x y) 2))
(defun improve(guess x) (average guess (/ x guess)))
(defun sqrt-iter(x guess) (if (good-enough? guess x)
			      guess 
			      (sqrt-iter x (improve guess x))))

;; Note that for example, for 1E-06 the original sqrt-iter returns
;; 0.031260654 which upon squaring gives 9.772285E-4. Not too hot!
;; For 1E25 sqrt-iter overflows.

;; better:
(defun good-enough2?(guess x) (< (/ (abs (- (improve guess x) guess)) guess) 0.01))
(defun sqrt-iter2(x guess) (if (good-enough2? guess x)
			      guess 
			      (sqrt-iter2 x (improve guess x))))

;; Now it works pretty well for 1E-6 and 1E-16 and up to 1E38!