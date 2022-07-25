member(A, [A|R]).
member(A, [B|R]) :- A \== B, member(A, R).