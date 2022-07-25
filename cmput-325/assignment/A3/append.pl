% facts
append( nil, X, X ). % fact 1 (base case)

% rules
append( cons( A, L1 ), L2, cons( A, L3 ) ) :- append( L1, L2, L3 ). % rule 1, a recursive process


% Query:
% ?- append(cons(a1, cons(a2, nil)), cons(b1, nil), Q).
% Match head of rule 1
% A = a1; L1 = cons(a2, nil); L2 = cons(b1, nil); Q -> cons(a1, L3)
% Replace with the body
% Subquery 1:
% ?- append(cons(a2, nil), cons(b1, nil), L3)
% Match head of rule 1
% A = a2; L1 = nil; L2 = cons(b1, nil), L3 -> cons(a2, L3')