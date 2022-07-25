% first parameter is an input, second parameter is an output
% fact(In, Out)

fact(0, 1). % base case
fact(1, 1). % base case
fact(N1, R1) :- N1 > 0, N2 is N1-1, fact(N2, R2), R1 is N1*R2.