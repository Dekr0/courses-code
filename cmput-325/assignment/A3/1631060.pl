% Question 1

% Helper predicate

% check a element is not a member of a list

% Base case
notMember(_, []) :- !. 

% Recursive case
notMember(A, [B|R]) :-
    A \== B,
    notMember(A, R).

% -------------------------------------------------------------------------------

% Main predicate

% Base case
setDifference(S1, [], S1).
setDifference([], S2, []).

% Recursive Case
setDifference([S1|R1], S2, [S1|S3]) :- % S1 not in S2
    notMember(S1, S2), !,
    setDifference(R1, S2, S3).

setDifference([S1|R1], S2, S3) :- % S1 in S2
    setDifference(R1, S2, S3).



% Question 2

% Base case
swap([], []).
swap([E1|[]], [E1]).
swap([E1, E2|[]], [E2, E1]).

% Recursive case
swap([E1, E2|R1], [E2, E1|R2]) :-
    swap(R1, R2).



% Question 3

% Helper predicate

% append L1 and L2

xappend([], X, X).
xappend([A|L1], L2, [A|L3]) :- 
    xappend(L1, L2, L3).

% -------------------------------------------------------------------------------

% Main predicate

% Base case
filter([], OP, N, []).

% Recursive case
filter([E1|R1], greaterThan, N, [E1|R2]) :- % head of list is a element and OP is true
    number(E1), 
    E1 > N, !, 
    filter(R1, greaterThan, N, R2).

filter([E1|R1], greaterThan, N, R2) :- % head of list is a element and OP is false
    number(E1), 
    filter(R1, greaterThan, N, R2).

filter([L1|R1], greaterThan, N, R3) :- % head of list is a list
    filter(L1, greaterThan, N, R4), % walk through the head and return the result R4
    filter(R1, greaterThan, N, R5), % walk through the rest of list and return the result R5
    xappend(R4, R5, R3). % append the result from head and the result from the rest of list

filter([E1|R1], equal, N, [E1|R2]) :- 
    number(E1), 
    E1 =:= N, !, 
    filter(R1, equal, N, R2).

filter([E1|R1], equal, N, R2) :- 
    number(E1), 
    filter(R1, equal, N, R2).

filter([L1|R1], equal, N, R3) :- 
    filter(L1, equal, N, R4), 
    filter(R1, equal, N, R5), 
    xappend(R4, R5, R3).

filter([E1|R1], lessThan, N, [E1|R2]) :- 
    number(E1), 
    E1 < N, !, 
    filter(R1, lessThan, N, R2).

filter([E1|R1], lessThan, N, R2) :- 
    number(E1), 
    filter(R1, lessThan, N, R2).

filter([L1|R1], lessThan, N, R3) :- 
    filter(L1, lessThan, N, R4), 
    filter(R1, lessThan, N, R5), 
    xappend(R4, R5, R3).



% Question 4

% Helper predicates

% Count occurence incre(+S, +M, -R)
% +S is the number of occurence of all elements
% +M is the element need to find in +S
% -R is the increment of +S

% Base case
incre([], E1, [[E1, 1]]). % +M is not in +S

% Recursive case
incre([[E1, C1]|R1], E1, [[E1, C2]|R1]) :- C2 is C1 + 1. % +M is in +S
incre([[E, C]|R1], M, [[E, C]|R2]) :- % +M is not match with the head of +S
    E1 \== M, 
    incre(R1, M, R2). % continue walk through the rest of +S

% Inserted sort (http://kti.mff.cuni.cz/~bartak/prolog/sorting.html)
insert([X, C1], [[Y, C2]|R], [[Y, C2]|NR]) :- 
    C1 > C2, 
    insert([X, C1], R, NR).
insert([X, C1], [[Y, C2]|R], [[X, C1], [Y, C2]|R]) :- 
    C1 =< C2.
insert([X, C], [], [[X, C]]).

isort([], A, A).
isort([H|T], A, S) :- 
    insert(H, A, NA), 
    isort(T, NA, S).

insertSort(L, S) :- isort(L, [], S).

% -------------------------------------------------------------------------------

% Main predicate

% Base case
countAll([], []).

% Recursive case
countAll([F|L], N) :- 
    countAll(L, R), !, 
    incre(R, F, NR), % Count occurence when returning a recursive call
    insertSort(NR, N). % Sort every time when returning a recursive call



% Question 5

% Helper predicate

% check if a element A is in the a list of pairs for replacement, 
% and return the corresponding replacement C

inPair(A, [[A, C]|_], C).
inPair(A, [[B, C1]|T], C2) :- 
    A \== B,
    inPair(A, T, C2).

% -------------------------------------------------------------------------------

% Main predicate

% Base case
sub([], S, []). % input is empty -> output is empty
sub(L, [], L). % no list of pairs, no replacement
sub(L, [], []). % an element is not in the a list of pairs

% Recursive case
sub([L|R], [[H, S]|T], L1) :- % head is a list
    sub(L, [[H, S]|T], NR1), % walk through the head
    sub(R, [[H, S]|T], NR2), 
    xappend([NR1], NR2, L1). % append the head and the rest after replacement

sub([H|R], [[H, S]|T], [S|NR]) :- % head is an atom but don't need replacement
    atom(H),
    sub(R, [[H, S]|T], NR), !.

sub([H|R], [[M, S]|T], [HS|NR]) :-  % head is an atom but does not match with the
% first pair but it exist an pair in the rest of lists of pairs 
    atom(H),
    inPair(H, T, HS), % check if it is in the list of pairs and return the replacement
    sub(R, T, NR), !.

sub([H|R], [[M, S]|T], [H|NR]) :- % head is an atom and find a replacement
    atom(H), 
    sub(R, [[M, S]|T], NR), !.



% Question 6

edge(a,b).
edge(b,c).
edge(c,a).

node(a).
node(b).
node(c).

% Helper predicate

% find all possible subset
% +[H|T] input
% -R subset of [H|T]

% Base case
subset([], []).

% Recursive case

subset([H|T], R) :- 
    % This case create a choice node for Prolog such that 
    % it can choose an alternative path, subset([H|T], [H|R]) 
    % when backtracking.
    subset(T, R).
subset([H|T], [H|R]) :- 
    subset(T, R).

isNode(N) :- node(N).

connect(N1, N2) :- edge(N1, N2).
connect(N1, N2) :- edge(N2, N1).

connectAll([]).
connectAll([N]).
connectAll([N1, N2|R]) :- 
    connect(N1, N2), 
    connectAll([N1|R]), 
    connectAll([N2|R]).

% -------------------------------------------------------------------------------

% Main predicate

clique(L) :- 
    findall(X, isNode(X), S), subset(S, L), connectAll(L).



% Question 7

use_module(library(lists)).

convert([], []).
convert([], _).
convert([e|R], NR) :- 
    convert(R, NR), !. 
convert([H|R], [w|NR]) :- 
    H \== q, 
    convert(R, NR).
convert([q|R], [q|NR1]) :- 
    append(L1, [q|L2], R), !, 
    convert(L2, NR2),
    append(L1, [q|NR2], NR1).
convert([q|R], [q|NR]) :- 
    convert(R, NR).