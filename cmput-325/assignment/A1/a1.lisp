; Name : Chengxuan Li
; Student Number : 1631060
; Course Number : CMPUT 325
; Lab Section : H02
; Assignment : 1

; Question 1
; Returns the number of atoms appearing in (nested) list L.
(defun xcount (L)
    (cond
        ((null L) 0) ; Base case => null
        ((atom L) 1) ; L is an atom or first of L in the previous called is an atom
        (t (+ (xcount (car L)) (xcount (cdr L)))) ; First atom of the list is a list
    )
)


; Question 2
; Return a list of atoms with the property that all the atoms appearing in L and 
; in the same order
(defun flatten (L)
    (cond
        ((null L) L) ; Base case => null
        ((atom L) (cons L ())) ; L is an atom or first of L in the previous called is an atom
        (t (append (flatten (car L)) (flatten (cdr L)))) ; First atom of the list is a list
    )
)


; Question 3
; Removes duplicate atoms while preserving the order in the given list L
(defun remove-duplicate (L)
    (cond
        ((null (cdr L)) L) ; Base case => a list with single atom => no duplicate
        
        ; The first atom of list L is in rest of the list L => then don't include it
        ((in (car L) (cdr L)) (remove-duplicate (cdr L)))
        
        ; Continue traverse through rest of the list
        (t (cons (car L) (remove-duplicate (cdr L))))
    )
)

; Helper function for Question 3
; Check whether an atom A is in a list L
(defun in (A L)
    (cond
        ((null L) nil) ; Base case => Atom A is not in list L
        ((equal A (car L)) t) ; Base case => Atom A is in list L
        (t (in A (cdr L))) ; Check whether an atom A is in rest of the list L
    )
)


; Question 4 (a)
; Mix the elements of L1 and L2 into a single list, by choosing elements 
; from L1 and L2 alternatingly. If one list is shorter than the other, 
; then append all remaining elements from the longer list at the end.
(defun mix (L1 L2)
    (cond
        ((and (null L1) (null L2)) ()) ; L1 and L2 are null => L1 and L2 have same length
        ((null L1) L2) ; L1 is null => L2 have more atoms than L1
        ((null L2) L1) ; L2 is null => L1 have more atoms than L2
        (t (append (cons (car L1) (cons (car L2) ())) (mix (cdr L1) (cdr L2))))
    )
)


; Question 4 (b)
; Returns a list of two sublists, the first one of which is the list of elements 
; in L at odd positions and the second is the list of elements in L at even 
; positions. If L is empty, then a list of two empty lists is returned.
(defun split (L)
    (cond 
        ((null L) '(nil nil)) ; Base case => L is empty
        (t (cons (oddEven L) (cons (oddEven (cdr L)) ())))
    )
)

; Question 4(b) Helper function
; Construct a list by trace through the elements in original list but skip one 
; element ahead in each recursive call 
(defun oddEven (L)
    (if (null (cddr L))
        (cons (car L) ()) ; Base case => L is empty

        ; Append first element with the first element of sub list that formed by 
        ; skipping on element
        (append (cons (car L) ()) (oddEven (cddr L))) 
    )
)


; Question 5
; Return a list of all subsets of L
(defun allsubsets (L) (gensubsets (cons NIL NIL) L))

; Question 5 Accumulator
(defun gensubsets (L1 L2) 
    (cond 
        ; Base case => L2 is an empty list and L1 is finish accumluating
        ((null L2) L1) ;  
        (t (gensubsets (append L1 (subsets L1 (car L2))) (cdr L2)))
    )
)

; Question 5 Helper function
; Update the current subset with a new element
(defun subsets (L A) 
    (cond 
        ((null L) NIL) 
        (t (cons (append (car L) (cons A ())) (subsets (cdr L) A)))
    )
)


; Question 6 (a)
; Return a list of webpage that can be reached by webage x directly or indirectly
(defun reached (x L)
    ; The second xreached make sure that there are no left over if there are 
    ; some webpages are reachable indirectly
    (let ((y (xreached NIL x L))) (xreached y x L))
)

; Question 6 (a) Accumulator
(defun xreached (AC x L)
    (let ( (A (caar L)) (B (cadar L)) ) ; pair (A, B)
        (cond 
            ((null L) AC) ; Base case => final result is completed after accumulating
            ; Case 1 => if webage A is webage x, or webpage A is in list of 
            ; webpages webpage x can reach 
            ((and ; 
                (or (eq A x) (in A AC) ) 
                (not (or (eq B x) (in B AC) ) ) ) (xreached (append AC (cdar L)) x (cdr L)) )
            (t (xreached AC x (cdr L))) ; Not reachable by webpage x
        )
    )
)


; Question 6 (b)
; Returns a permutation of S such that the web pages are ordered by number of 
; times being referenced
(defun rank (S L)
    (let ( (A (caar L)) (B (cadar L)) )
        (cond 
            ; First recursive call if it doesn't call zero() function
            ((atom (car S)) (rank (zero S) L))
            ; Extract the result once L is exhausted and the result is sorted
            ((null L) (decompress (xsort S)))
            ; Do not increase the number of references if webpage is self-referencing
            ((or (eq A B) (in (car L) (cdr L))) (rank S (cdr L)))
            (t (rank (increment S B) (cdr L)))
        )
    )
)

; All Helper functions for Question 6 (b)

; Increment number of references of a webpage by one
(defun increment (SS x)
    (cond 
        ((eq (caar SS) x) (cons (cons (caar SS) (cons (+ (cadar SS) 1) ())) (cdr SS)))
        (t (cons (car SS) (increment (cdr SS) x)))
    )
)

; Generate and initialize a list of pair for counting number of references 
; of each webpage ; E.g, ((WebPageA 0), (WebPageB 0), ...)
(defun zero (L)
    (cond 
        ((null L) L)
        (t (cons (cons (car L) '(0)) (zero (cdr L))) )
    )
)

; Remove the number for counting the number of references after sorting
(defun decompress (L)
    (if (null L)
        L
        (cons (caar L) (decompress (cdr L)))
    )
)

; Sorintg Function
(defun xsort (L)
    (sort L 'greater)
)

(defun greater (L1 L2)
    (> (cadr L1) (cadr L2))
)
