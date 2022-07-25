/*
-------------------------------
| A  B  3 | C  2  D | 6  E  F |
| 9  G  H | 3  I  5 | J  K  1 |
| _  _  1 | 8  _  6 | 4  _  _ |
|-----------------------------|
| _  _  8 | 1  _  2 | 9  _  _ |
| 7  _  _ | O  _  _ | _  _  8 |
| _  _  6 | 7  _  8 | 2  _  _ |
|-----------------------------|
| _  _  2 | 6  _  9 | 5  _  _ |
| 8  _  L | 2  _  3 | _  _  9 |
| _  _  5 | M  1  N | 3  _  _ |
-------------------------------

A = {4,5}
B = {4,5,7,9}
C = {9} *
D = {1,4,7}
E = {5,7,8,9}
F = {5,7}
G = {2,4,6,7,8}
H = {4,7}
I = {4,7}
J = {7,8}
K = {2,7,8}
L = {4,7}
M = {4} *
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
