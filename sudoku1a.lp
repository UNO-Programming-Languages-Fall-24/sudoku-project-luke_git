% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...
n=4.

% Each cell (row, column) must contain exactly one number (between 1 and n)
1 { answerCell(row, column, number) : number = 1..n } 1 :- row = 1..n, column = 1..n.

% Constraints
% No two cells in the same row can have the same number
:- answerCell(row, column1, number), answerCell(row, column2, number), column1 != column2.

% No two cells in the same column can have the same number
:- answerCell(row1, column, number), answerCell(row2, column, number), row1 != row2.


#show sudoku/3.
