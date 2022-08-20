; Name : Chengxuan Li
; Student Number : 1631060
; Course Number : CMPUT 325
; Lab Section : H02
; Assignment : 2

; function fl-interp is built by modifying and extending 
; based on the skeleton code from eClass
(defun fl-interp (E P)
    (cond 
        ((atom E) E) ; E is a nil or a number
        (t ; E is a lists of expression
            (let ((f (car E)) (arg (cdr E))) 
            ; assume (car E) to be a function
            ; assume (cdr E) to be a list of arguments 
            ; an argument can be an atom, expression or a function application.
            ; thus, arguments need to be evaluated by fl-interp before applying
                (cond 
                    ((eq f 'and) ; "and" function 
                        (if (null (fl-interp (car arg) P)) 
                        ; if first operand of "and" function is false, 
                        ; the entire "and" expression is false. Otherwise, 
                        ; continue evaluate the rest of arguments
                            NIL 
                            (not (null (fl-interp (cadr arg) P)))
                        )
                    ) 
                    ; check if an expression is an atom
                    ((eq f 'atom) (atom (fl-interp (car arg) P))) 
                    ; construct a list or a s-expression
                    ((eq f 'cons) (cons (fl-interp (car arg) P) (fl-interp (cadr arg) P))) 
                    ; check whether if two arguments are equal (not work for list)
                    ((eq f 'eq) (eq (fl-interp (car arg) P) (fl-interp (cadr arg) P))) 
                    ; check whether if two arguments are equal (work for list)
                    ((eq f 'equal) (equal (fl-interp (car arg) P) (fl-interp (cadr arg) P))) 
                    ; return the first argument of a list
                    ((eq f 'first) (car (fl-interp (car arg) P))) 
                    ((eq f 'if) ; if-else statement
                        (if (fl-interp (car arg) P) 
                            (fl-interp (cadr arg) P) 
                            (fl-interp (caddr arg) P)
                        )
                    ) 
                    ; logical not
                    ((eq f 'not) (not (fl-interp (car arg) P))) 
                    ; check if an argument is null
                    ((eq f 'null) (null (fl-interp (car arg) P))) 
                    ; check if an argument is a number
                    ((eq f 'number) (numberp (fl-interp (car arg) P))) 
                    ((eq f 'or) ; logical or
                        (if (not (null (fl-interp (car arg) P)))  
                            ; if one of the operands is true, logical or is true
                            ; Otherwise, continue to evaluate the rest of the argument
                            T 
                            (not (null (fl-interp (cadr arg) P)))
                        )
                    ) 
                    ; return the rest of the elements in the list
                    ((eq f 'rest) (cdr (fl-interp (car arg) P))) 
                    ; basic arithmetic operation
                    ((eq f '+) (+ (fl-interp (car arg) P) (fl-interp (cadr arg) P))) 
                    ((eq f '-) (- (fl-interp (car arg) P) (fl-interp (cadr arg) P))) 
                    ((eq f '*) (* (fl-interp (car arg) P) (fl-interp (cadr arg) P))) 
                    ((eq f '>) (> (fl-interp (car arg) P) (fl-interp (cadr arg) P))) 
                    ((eq f '<) (< (fl-interp (car arg) P) (fl-interp (cadr arg) P))) 
                    ((eq f '=) (= (fl-interp (car arg) P) (fl-interp (cadr arg) P))) 
                    ; check if f is in the program / a list of user function
                    ; if true, evaluate the user functions
                    ((is-func f P) (xeval f arg P NIL)) 
                    (t E)
                )
            )
        )
    )
)

; Check if a function can be evaluated (number of arguments in function equal to 
; the number of provided arguments)
; F - function name
; P - program
; N - number of provided arguments
(defun can-eval (F P N)
    (cond 
        ((null P) NIL) 
        ((and (eq F (caar P)) (eq (xcount (cadar P)) N)) T) 
        (t (can-eval F (cdr P) N))
    )
)

; N - name of the function
; P - a list of user-defined functions 
(defun is-func (N P)
    (cond 
        ; N is not a user-defined function if the list is exhausted
        ((null P) NIL) 
        ; Return true if N is user-defined function
        ((eq N (caar P)) T) 
        ; Continue search through the list of user-defined functions
        (t (is-func N (cdr P))) 
    )
)

; Replace a bounded variable with a corresponding evaluated argument.
; The name list and argument list should be parallel.
; N name of the bounded variable
; P name list
; V value list
(defun locate (N P A)
    (cond 
        ; return NIL if it can't find a matched variable name
        ((null P) NIL) 
        ; return the corresponding evaluated argument (value) 
        ((eq N (car P)) (car A)) 
        ; continue to search through the name list and value list
        (t (locate N (cdr P) (cdr A)))
    )
)

; Replace the function name with its function body
; F function name
; P program
; V evaluated argument / value list
(defun replace-body (F P V)
    (cond 
     ; can't find the function name in the list of users-defined functions
        ((null P) P) 
        ; replace the function name with its body if the number of arguments in 
        ; the function matches the number of arguments provided
        ((and (eq F (caar P)) (eq (xcount (cadar P)) (xcount V))) (xassoc (cadar P) (car (cdddar P)) V)) 
        (t (replace-body F (cdr P) V))
    )
)

; Replace the function body and all bounded variables in the function body 
; with the evaluated arguments 
; P parameter list
; B body
; V evaluated argument / value list
(defun xassoc (P B V)
    (cond 
        ((null B) B) 
        ((atom (car B)) 
        ; if the current element in the function body is not a list,
        ; if it is a bounded variable, replace with evaluated argument
        ; otherwise, use it to construct the function body without replacement
            (if (member (car B) P) 
                (cons (locate (car B) P V) (xassoc P (cdr B) V)) 
                (cons (car B) (xassoc P (cdr B) V)) 
            )
        ) 
        ; if the current element is a list, workthrough the current element and 
        ; replace all the bounded variables in that list
        (t (cons (xassoc P (car B) V) (xassoc P (cdr B) V)))
    )
)

; Count the number of elements in the list
(defun xcount (L)
    (cond
        ((null L) 0) ; Base case => null
        (t (+ 1 (xcount (cdr L))))
    )
)

; Eval the user-defined function along with the provided argument in AOR
; F function name
; E list of arguments
; P program
; V value list / evaluated argument (accumulator)
(defun xeval (F E P V)
    (if (null E) 
        ; if the input argument lists is empty -> all the input arguments 
        ; are evaluated
        (if (can-eval F P (xcount V)) 
        ; check if there are enough evaluated argument to apply in the 
        ; function. 
        ; If it is true, apply the evaluated argument and 
        ; evaluate the function after replacing the body of the fucntion
        ; Otherwise, return function name and the evaluated argument
            (fl-interp (replace-body F P V) P) 
            (cons F V) 
        ) 
        ; Continue to evaluate (using fl-interp) the rest of the arguments before 
        ; evaluating the function, and appends the evaluated argument into value list
        (xeval F (cdr E) P (append V (cons (fl-interp (car E) P) NIL)))
    )
)
