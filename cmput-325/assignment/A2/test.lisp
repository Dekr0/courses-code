;testing 
(setq P '(
    (count (L) =   (if  (null L)
                         0
                         (+ 1 (count (rest L)))))
    (reverse (X) =  (if (null X) 
                        nil
                        (append (reverse (rest X)) 
                                (cons (first X) nil))))      

    (append (X Y) = (if (null X) 
                        Y
                        (cons (first X) (append (rest X) Y))))
))

(setq t1 (fl-interp '(+ 10 5) nil)) ; > 15
(setq t2 (fl-interp '(- 12 8) nil)) ; > 4
(setq t3 (fl-interp '(* 5 9) nil)) ; > 45
(setq t4 (fl-interp '(> 2 3) nil)) ; > nil
(setq t5 (fl-interp '(< 1 131) nil)) ; > t
(setq t6 (fl-interp '(= 88 88) nil)) ; > t 
(setq t7 (fl-interp '(and nil t) nil)) ; > nil
(setq t8 (fl-interp '(or t nil) nil)) ; > t
(setq t9 (fl-interp '(not t) nil)) ; > 'nil
(setq t10 (fl-interp '(number 354) nil)) ; > t
(setq t11 (fl-interp '(equal (3 4 1) (3 4 1)) nil)) ; > t
(setq t12 (fl-interp '(if nil 2 3) nil)) ; > 3
(setq t13 (fl-interp '(null ()) nil)) ; > t
(setq t14 (fl-interp '(atom (3)) nil)) ; > nil
(setq t15 (fl-interp '(eq x x) nil)) ; > t
(setq t16 (fl-interp '(first (8 5 16)) nil)) ; > 8
(setq t17 (fl-interp '(rest (8 5 16)) nil)) ; > (5 16)
(setq t18 (fl-interp '(cons 6 3) nil)) ; > (6 . 3)
(setq t19 (fl-interp '(+ (* 2 2) (* 2 (- (+ 2 (+ 1 (- 7 4))) 2))) nil)) ; > 12
(setq t20 (fl-interp '(and (> (+ 3 2) (- 4 2)) (or (< 3 (* 2 2)) (not (= 3 2)))) nil)) ; > t
(setq t21 (fl-interp '(or (= 5 (- 4 2)) (and (not (> 2 2)) (< 3 2))) nil)) ; > nil
(setq t22 (fl-interp '(if (not (null (first (a c e)))) (if (number (first (a c e))) (first (a c e)) (cons (a c e) d)) (rest (a c e))) nil)) ; > ((a c e) . d)
(setq t23 (fl-interp '(greater 3 5) '((greater (x y) = (if (> x y) x (if (< x y) y nil)))))) ; > 5
(setq t24 (fl-interp '(square 4) '((square (x) = (* x x))))) ; > 16
(setq t25 (fl-interp '(simpleinterest 4 2 5) '((simpleinterest (x y z) = (* x (* y z)))))) ; > 40
(setq t26 (fl-interp '(xor t nil) '((xor (x y) = (if (equal x y) nil t))))) ; > t
(setq t27 (fl-interp '(cadr (5 1 2 7)) '((cadr(x) = (first (rest x)))))) ; > 1
(setq t28 (fl-interp '(last (s u p)) '((last (x) = (if (null (rest x)) (first x) (last (rest x))))))) ; > p
(setq t29 (fl-interp '(push (1 2 3) 4) '((push (x y) = (if (null x) (cons y nil) (cons (first x) (push (rest x) y))))))) ; > (1 2 3 4)
(setq t30 (fl-interp '(pop (1 2 3)) '((pop (x) = (if (atom (rest (rest x))) (cons (first x) nil) (cons (first x) (pop (rest x)))))))) ; > (1 2)
(setq t31 (fl-interp '(power 4 2) '((power (x y) = (if (= y 1) x (power (* x x) (- y 1))))))) ; > 16
(setq t32 (fl-interp '(factorial 4) '((factorial (x) = (if (= x 1) 1 (* x (factorial (- x 1)))))))) ; > 24
(setq t33 (fl-interp '(divide 24 4) '((divide (x y) = (div x y 0)) (div (x y z) = (if (> (* y z) x) (- z 1) (div x y (+ z 1))))))) ; > 6
(setq t34 (fl-interp '(last (s u p)) '((last (x) = (if (null (rest x)) (first x) (last (rest x))))))) ; > p
(setq t35 (fl-interp '(push (1 2 3) 4) '((push (x y) = (if (null x) (cons y nil) (cons (first x) (push (rest x) y))))))) ; > (1 2 3 4)
(setq t36 (fl-interp '(pop (1 2 3)) '((pop (x) = (if (atom (rest (rest x))) (cons (first x) nil) (cons (first x) (pop (rest x)))))))) ; > (1 2)
(setq t37 (fl-interp '(power 4 2) '((power (x y) = (if (= y 1) x (power (* x x) (- y 1))))))) ; > 16
(setq t38 (fl-interp '(factorial 4) '((factorial (x) = (if (= x 1) 1 (* x (factorial (- x 1)))))))) ; > 24
(setq t39 (fl-interp '(divide 24 4) '((divide (x y) = (div x y 0)) (div (x y z) = (if (> (* y z) x) (- z 1) (div x y (+ z 1))))))) ; > 6
(setq t40 (fl-interp '(count  (a b c)) P)) ;=> 3
(setq t41 (fl-interp '(append  (a b c) (1 2)) P)) ;=> (a b c 1 2)
(setq t42 (fl-interp '(reverse  (a b c)) P)) ;=> (c b a)
(setq t43 (fl-interp '(count (append (a b c) (1 2 3))) P)) ;=> 6