% clear screen
cls :- tty_clear.

% facts
% p(a).
father(ken, mary).
father(peter, berktan).
father(berktan, dillon).
mother(lily, mary).
mother(mary, john).

% rules
% p(f(X)) :- p(X).
grandparent(X,Z) :- parent(X,Y), parent(Y,Z).
parent(X,Y) :- father(X,Y).
parent(X,Y) :- mother(X,Y).

