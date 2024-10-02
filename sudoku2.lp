% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Define the grid size
#const n = 9.

% Pre-fill cells with initial values
sudoku(Row, Col, Num) :- initial(Row, Col, Num).

% Subgrid 1: Top-left (rows 1 to 3, columns 1 to 3)
subgrid(X, Y, 1) :- X = 1..3, Y = 1..3.

% Subgrid 2: Top-center (rows 1 to 3, columns 4 to 6)
subgrid(X, Y, 2) :- X = 1..3, Y = 4..6.

% Subgrid 3: Top-right (rows 1 to 3, columns 7 to 9)
subgrid(X, Y, 3) :- X = 1..3, Y = 7..9.

% Subgrid 4: Middle-left (rows 4 to 6, columns 1 to 3)
subgrid(X, Y, 4) :- X = 4..6, Y = 1..3.

% Subgrid 5: Middle-center (rows 4 to 6, columns 4 to 6)
subgrid(X, Y, 5) :- X = 4..6, Y = 4..6.

% Subgrid 6: Middle-right (rows 4 to 6, columns 7 to 9)
subgrid(X, Y, 6) :- X = 4..6, Y = 7..9.

% Subgrid 7: Bottom-left (rows 7 to 9, columns 1 to 3)
subgrid(X, Y, 7) :- X = 7..9, Y = 1..3.

% Subgrid 8: Bottom-center (rows 7 to 9, columns 4 to 6)
subgrid(X, Y, 8) :- X = 7..9, Y = 4..6.

% Subgrid 9: Bottom-right (rows 7 to 9, columns 7 to 9)
subgrid(X, Y, 9) :- X = 7..9, Y = 7..9.

% Choice Rule: 
% Each cell (Row, Column) must contain exactly one number (between 1 and n)
1 { sudoku(Row, Column, Number) : Number = 1..n } 1 :- Row = 1..n, Column = 1..n.

% Constraints
% No two cells in the same row can have the same number
:- sudoku(Row, Column, Number), sudoku(Row, Column1, Number), Column != Column1.

% No two cells in the same column can have the same number
:- sudoku(Row, Column, Number), sudoku(Row1, Column, Number), Row != Row1.

% No two cells in the same subgrid can have the same number
:- sudoku(X1, Y1, Number), sudoku(X2, Y2, Number), subgrid(X1, Y1, G), subgrid(X2, Y2, G), X1 != X2, Y1 != Y2.

#show sudoku/3.
