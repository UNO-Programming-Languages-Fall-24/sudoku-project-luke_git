% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Define the grid size
#const n = 4.

% Pre-fill cells with initial values
sudoku(Row, Col, Num) :- initial(Row, Col, Num).

% Choice Rule: 
% Each cell (Row, Column) must contain exactly one number (between 1 and n)
1 { sudoku(Row, Column, Number) : Number = 1..n } 1 :- Row = 1..n, Column = 1..n.

% Constraints
% No two cells in the same row can have the same number
:- sudoku(Row, Column, Number), sudoku(Row, Column1, Number), Column != Column1.

% No two cells in the same column can have the same number
:- sudoku(Row, Column, Number), sudoku(Row1, Column, Number), Row != Row1.

#show sudoku/3.

