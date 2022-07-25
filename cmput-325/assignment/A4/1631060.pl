% Question 1

:- use_module(library(clpfd)).

insert_data :-
    assert(c325(fall_2021,aperf,15,15,15,15,75,99)),
    assert(c325(fall_2021,john,14,13,15,10,76,87)),
    assert(c325(fall_2021,lily, 9,12,14,14,76,92)),
    assert(c325(fall_2021,peter,8,13,12,9,56,58)),
    assert(c325(fall_2021,ann,14,15,15,14,76,95)),
    assert(c325(fall_2021,ken,11,12,13,14,54,87)),
    assert(c325(fall_2021,kris,13,10,9,7,60,80)),
    assert(c325(fall_2021,audrey,10,13,15,11,70,80)),
    assert(c325(fall_2021,randy,14,13,11,9,67,76)),
    assert(c325(fall_2021,david,15,15,11,12,66,76)),
    assert(c325(fall_2021,sam,10,13,10,15,65,67)),
    assert(c325(fall_2021,kim,14,13,12,11,68,78)),
    assert(c325(fall_2021,perf,15,15,15,15,80,100)),
    assert(setup(fall_2021,as1,15,0.1)),
    assert(setup(fall_2021,as2,15,0.1)),
    assert(setup(fall_2021,as3,15,0.1)),
    assert(setup(fall_2021,as4,15,0.1)),
    assert(setup(fall_2021,midterm,80,0.2)),
    assert(setup(fall_2021,final,100,0.4)).

%------------------------------------------------------------------------------- 

% Helper predicate for query 1
getMarks(Semester, Name, [[as1, As1], [as2, As2], [as3, As3], [as4, As4], [midterm, Midterm], [final, Final]]) :-
    c325(Semester,Name, As1, As2, As3, As4, Midterm, Final),!.

totalMark(Semester, [], 0).
totalMark(Semester, [[Type, Score]|L], Total) :-
    setup(Semester, Type, Max, Percentage),
    totalMark(Semester, L, Total1),
    Total is Score / Max * Percentage * 100 + Total1.


query1(Semester, Name, Total) :-
    getMarks(Semester, Name, Marks),
    totalMark(Semester, Marks, Total).

%-------------------------------------------------------------------------------

% Helper predicate for query 2

xquery2(Semester, Name, [[as1, As1], [as2, As2], [as3, As3], [as4, As4], [midterm, Midterm], [final, Final]]) :-
    c325(Semester,Name, As1, As2, As3, As4, Midterm, Final),
    Midterm < Final.


query2(Semester, L) :-
    findall(Name, xquery2(Semester, Name, _), L).

%-------------------------------------------------------------------------------

% Helper predicate for query 3

setMark([[Type, Mark]|R1], InType, NewMark, UpdatedMarks) :-
    Type == InType,
    append([[Type, NewMark]], R1, UpdatedMarks), !.
setMark([[Type, Mark]|R1], InType, NewMark, [[Type, Mark]|R2]) :-
    Type \= InType,
    setMark(R1, InType, NewMark, R2).

deleteRecord(Semester, Name, [[as1, As1], [as2, As2], [as3, As3], [as4, As4], [midterm, Midterm], [final, Final]]) :-
    retract(c325(Semester, Name,As1, As2, As3, As4, Midterm, Final)),
    \+clause(c325(Semester, Name,As1, As2, As3, As4, Midterm, Final),_).

insertRecord(Semester, Name, [[as1, As1], [as2, As2], [as3, As3], [as4, As4], [midterm, Midterm], [final, Final]]) :-
    assert(c325(Semester, Name,As1, As2, As3, As4, Midterm, Final)),
    clause(c325(Semester, Name,As1, As2, As3, As4, Midterm, Final),_).

updateRecord(Semester, Name, OldMarks, NewMarks) :-
    deleteRecord(Semester, Name, OldMarks),
    insertRecord(Semester, Name, NewMarks).


query3(Semester, Name, Type, NewMark) :-
    getMarks(Semester, Name, OldMarks),
    setMark(OldMarks, Type, NewMark, UpdatedMarks),
    updateRecord(Semester, Name, OldMarks, UpdatedMarks),!.

query3(Semester, Name, Type, NewMark) :- 
    write("record not found"), !.

%-------------------------------------------------------------------------------

/*

Question 2

Example 1

A = {4,5}               -------------------------------
B = {4,5,7,9}           | A  B  3 | C  2  D | 6  E  F |
C = {9} *               | 9  G  H | 3  I  5 | J  K  1 |
D = {1,4,7}             | _  _  1 | 8  _  6 | 4  _  _ |
E = {5,7,8,9}           |-----------------------------|
F = {5,7}               | _  _  8 | 1  _  2 | 9  _  _ |
G = {2,4,6,7,8}         | 7  _  _ | O  _  _ | _  _  8 |
H = {4,7}               | _  _  6 | 7  _  8 | 2  _  _ |
I = {4,7}               |-----------------------------|
J = {7,8}               | _  _  2 | 6  _  9 | 5  _  _ |
K = {2,7,8}             | 8  _  L | 2  _  3 | _  _  9 |
L = {4,7}               | _  _  5 | M  1  N | 3  _  _ |
M = {4} *               -------------------------------
N = {4,7} *
O = {4,5,9} *

Arcs (Does not include all the arcs):
B != C
C != D
C != E
C != O
D != N
M != N
M != O

Queue:
B != C B = {4,5,7}
C != B no change
C != D no change
D != C no change
C != E E = {5,7,8}
E != C no change
C != O no change
O != C O = {4,5}
D != N no change
N != D no change
M != N no change
N != M N = {7}, append D != N into queue
M != O no change
O != M O = {5}, append C != O into queue
D != N D = {1,4}, append C != D into queue
C != O no change
C != D no change

Example 2

One example in the second sudoku is cell at row 1, column 2. AC-3 algorithm 
relies on a specific type of cells whose domain size are 1. These type of 
cells also need to stay with the cells, whose domain size are as minimal as
possible, in the same column, same row or same 3x3 grid. This allows the 
cells with domain size 1 to restrict other grids, eliminate the possible 
values, and decrease domain size to 1 or closer to 1. A sudoku is solvable 
by AC-3 algorithm if and only if there's at least one cell with domain size 1 
and enough number of cells with domain size 1 as well as cells with minimal 
domain size other than 1.
*/

%-------------------------------------------------------------------------------

% Question 3

% Helper predicate for question 3

xlabel([]).
xlabel([V|Vs]) :-
    indomain(V),
    xlabel(VS).

generate_power(1, [0]) :- !.
generate_power(N, [H|L]) :-
    H #= N - 1,
    generate_power(H, L).

xsum(L, [], 0).
xsum([H1|L1], [H2|L2], S) :-
    xsum(L1, L2, NS),
    S #= H1 * 10 ^ H2 + NS. 


encrypt(W1, W2, W3) :-
    length(W1, N1), % length of W1
    length(W3, N2), % length of W3
    append(W1, W2, W), 
    append(W, W3, L),
    list_to_set(L, Letters), % remove duplicates
    [LeadLetter1|_] = W1,
    [LeadLetter2|_] = W2,
    [LeadLetter3|_] = W3,
    !,
    Letters ins 0..9,
    all_different(Letters),
    LeadLetter1 #\= 0,
    LeadLetter2 #\= 0,
    LeadLetter3 #\= 0,
    generate_power(N1, P1),
    generate_power(N2, P2),
    S3 #= S1 + S2,
    xsum(W1, P1, S1),
    xsum(W2, P1, S2),
    xsum(W3, P2, S3),
    labeling([], Letters).

% encrypt([D,O,M,A,L,D],[G,E,R,A,L,D],[R,O,B,E,R,T]).
% encrypt([B,A,S,E],[B,A,L,L],[G,A,M,E,S]).
% encrypt([C,R,O,S,S],[R,O,A,D,S],[D,A,N,G,E,R])

%-------------------------------------------------------------------------------

% Question 4

% grid
grid(0,[]).
grid(N, [[H|R1]|R2]) :-
    N1 #= N - 1,
    grid(N1, R2).


transpose_first_row([F1|R1], [[F2|_]|RestRow], [F1,F2|R2]) :-
    transpose_first_row([F1|R1], RestRow, R2).

xtranspose([FirstRow|RestRow], [FirstCol|RestCol]) :-
    transpose_first_row(FirstRow, RestRow, FirstCol).
    xtranspose(RestRow, RestCol).   


% xall_distinct
xall_distinct([]).
xall_distinct([_]).
xall_distinct([A, B|R]) :-
    A #\= B,
    xall_distinct([A|R]),
    xall_distinct([B|R]).