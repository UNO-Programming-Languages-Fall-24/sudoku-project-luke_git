% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Define the grid size
#const n = 4.

% Pre-fill cells with initial values
sudoku(Row, Col, Num) :- initial(Row, Col, Num).

% Subgrid 1: Top-left
subgrid(X, Y, 1) :- X = 1..2, Y = 1..2.

% Subgrid 2: Top-right
subgrid(X, Y, 2) :- X = 1..2, Y = 3..4.

% Subgrid 3: Bottom-left
subgrid(X, Y, 3) :- X = 3..4, Y = 1..2.

% Subgrid 4: Bottom-right
subgrid(X, Y, 4) :- X = 3..4, Y = 3..4.

% Choice Rule: 
% Each cell (Row, Column) must contain exactly one number (between 1 and n)
1 { sudoku(Row, Column, Number) : Number = 1..n } 1 :- Row = 1..n, Column = 1..n.

% Constraints
% No two cells in the same row can have the same number
:- sudoku(Row, Column, Number), sudoku(Row, Column1, Number), Column != Column1.

% No two cells in the same column can have the same number
:- sudoku(Row, Column, Number), sudoku(Row1, Column, Number), Row != Row1.

% No two cells in the same subgrid can have the same number

#show sudoku/3.
#show subgrid/3.
