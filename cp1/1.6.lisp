(defun new-if(predicate then-clause else-clause)
  (cond (predicate then-clause)
	(t else-clause)))

(defun square(x) (* x x))

(defun average(x y)
  (/ (+ x y) 2))

(defun improve(guess x)
  (average guess (/ x guess)))

(defun good-enough?(guess x)
  (< (abs (- (square guess) x)) 0.001))

(defun sqrt-iter(guess x)
  (print guess)
  (if (good-enough? guess x)
	  guess
	  (sqrt-iter (improve guess x) x)))

