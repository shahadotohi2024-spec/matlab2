% ============================================
% DEFINING AND CHANGING ARRAY VARIABLES DEMO
% ============================================
clear all;
clc;

disp('========================================');
disp('DEFINING AND CHANGING ARRAY VARIABLES');
disp('========================================');
disp('');

% ============================================
% 1. DEFINE VARIABLES
% ============================================
disp('1. DEFINE VARIABLES');
disp('-------------------');

% Define scalar
a = 5;
disp('a = 5');
disp(['a = ', num2str(a)]);
disp('');

% Define 2x3 matrix
A = [1 2 3; 4 5 6];
disp('A = [1 2 3; 4 5 6]');
disp('Matrix A:');
disp(A);
disp('');

% Define row vector with spaces
B = [1 2 3 4 5 6];
disp('B = [1 2 3 4 5 6] (Row vector)');
disp('Vector B:');
disp(B);
disp('');

% ============================================
% 2. CONCATENATE ARRAYS
% ============================================
disp('2. CONCATENATE ARRAYS');
disp('----------------------');

C = [1 2; 3 4];
D = [5 6; 7 8];

disp('Matrix C:');
disp(C);
disp('Matrix D:');
disp(D);

% Horizontal concatenation
E = [C, D];
disp('[C, D] (Horizontal concatenation):');
disp(E);
disp('');

% Vertical concatenation
F = [C; D];
disp('[C; D] (Vertical concatenation):');
disp(F);
disp('');

% ============================================
% 3. CHANGE ELEMENTS
% ============================================
disp('3. CHANGE ELEMENTS');
disp('------------------');

% Create vector
x = [1 2 3 4 5 6 7 8 9 10];
disp('Original x:');
disp(x);

% Change 4th element
x(4) = 7;
disp('x(4) = 7');
disp('Updated x:');
disp(x);
disp('');

% Change matrix element
A = [1 2 3; 4 5 6; 7 8 9];
disp('Original Matrix A:');
disp(A);

A(1,3) = 5;
disp('A(1,3) = 5');
disp('Updated Matrix A:');
disp(A);
disp('');

% ============================================
% 4. INDEXING AND SLICING
% ============================================
disp('4. INDEXING AND SLICING');
disp('------------------------');

x = 1:20;
disp('x = 1:20');
disp('Vector x:');
disp(x);
disp('');

% Get 5th to 10th elements
disp('x(5:10) (5th to 10th elements):');
disp(x(5:10));
disp('');

% Get every 2nd element
disp('x(1:2:end) (Every 2nd element):');
disp(x(1:2:end));
disp('');

% ============================================
% 5. CONDITIONAL INDEXING
% ============================================
disp('5. CONDITIONAL INDEXING');
disp('------------------------');

x = [1 5 3 8 2 9 4 7 6 10];
disp('x =');
disp(x);
disp('');

% List elements greater than 6
disp('x(x > 6) (Elements greater than 6):');
disp(x(x > 6));
disp('');

% Change elements using condition
x(x == 10) = 1;
disp('x(x == 10) = 1 (Change 10 to 1):');
disp(x);
disp('');

% ============================================
% 6. MATRIX ROW AND COLUMN ACCESS
% ============================================
disp('6. MATRIX ROW AND COLUMN ACCESS');
disp('-------------------------------');

A = [1 2 3 4 5; 6 7 8 9 10; 11 12 13 14 15; 16 17 18 19 20];
disp('Matrix A (4x5):');
disp(A);
disp('');

% Get 4th row
disp('A(4,:) (4th row):');
disp(A(4,:));
disp('');

% Get 3rd column
disp('A(:,3) (3rd column):');
disp(A(:,3));
disp('');

% Get specific elements
disp('A(2, 2:4) (2nd row, 2nd to 4th columns):');
disp(A(2, 2:4));
disp('');

% ============================================
% 7. SWAP COLUMNS
% ============================================
disp('7. SWAP COLUMNS');
disp('----------------');

A = [1 2 3 4 5 6 7; 8 9 10 11 12 13 14];
disp('Original Matrix A:');
disp(A);

% Swap 1st and 7th column
A(:, [1 7]) = A(:, [7 1]);
disp('A(:, [1 7]) = A(:, [7 1]) (Swap 1st and 7th column):');
disp(A);
disp('');

% ============================================
% 8. RANGES AND SPACING
% ============================================
disp('8. RANGES AND SPACING');
disp('----------------------');

% Basic range
disp('a:b = 1:10:');
disp(1:10);
disp('');

% Range with step size
disp('a:ds:b = 1:2:10:');
disp(1:2:10);
disp('');

% Linspace
disp('linspace(0, 10, 6) (6 equally spaced values):');
disp(linspace(0, 10, 6));
disp('');

% Logspace
disp('logspace(1, 3, 5) (5 logarithmically spaced values):');
disp(logspace(1, 3, 5));
disp('');

% ============================================
% 9. SPECIAL MATRICES
% ============================================
disp('9. SPECIAL MATRICES');
disp('-------------------');

% Zeros matrix
disp('zeros(3,4) (3x4 matrix of zeros):');
disp(zeros(3,4));
disp('');

% Ones matrix
disp('ones(2,5) (2x5 matrix of ones):');
disp(ones(2,5));
disp('');

% Identity matrix
disp('eye(4) (4x4 identity matrix):');
disp(eye(4));
disp('');

% ============================================
% 10. DIAGONAL MATRIX
% ============================================
disp('10. DIAGONAL MATRIX');
disp('--------------------');

x = [2 4 6 8];
disp('x = [2 4 6 8]');
disp('Vector x:');
disp(x);

% Create diagonal matrix
A = diag(x);
disp('A = diag(x) (Diagonal matrix from vector):');
disp(A);
disp('');

% Get diagonal elements
d = diag(A);
disp('diag(A) (Get diagonal elements):');
disp(d);
disp('');

% ============================================
% 11. MESHGRID (2D and 3D grids)
% ============================================
disp('11. MESHGRID');
disp('-------------');

x = 1:3;
y = 1:4;
disp('x = 1:3');
disp('y = 1:4');

[X, Y] = meshgrid(x, y);
disp(' [X, Y] = meshgrid(x, y)');
disp('X:');
disp(X);
disp('Y:');
disp(Y);
disp('');

% ============================================
% 12. RANDOM NUMBERS
% ============================================
disp('12. RANDOM NUMBERS');
disp('-------------------');

% Uniform distribution (0-1)
disp('rand(3,3) (3x3 uniform random numbers):');
disp(rand(3,3));
disp('');

% Random integers
disp('randi([1, 100], 3, 3) (3x3 random integers 1-100):');
disp(randi([1, 100], 3, 3));
disp('');

% Normal distribution
disp('randn(3,3) (3x3 normal random numbers):');
disp(randn(3,3));
disp('');

% ============================================
% 13. PRACTICAL EXAMPLE
% ============================================
disp('13. PRACTICAL EXAMPLE');
disp('---------------------');

% Create data
data = randn(5, 4) * 10 + 50;
disp('Created 5x4 matrix of random data:');
disp(data);
disp('');

% Modify data
data(data < 45) = 45;
disp('data(data < 45) = 45 (Set values below 45 to 45):');
disp(data);
disp('');

% Get statistics
disp('Column means:');
disp(mean(data, 1));
disp('');

disp('Row means:');
disp(mean(data, 2));
disp('');

% Extract specific parts
disp('First 3 rows, columns 2-4:');
disp(data(1:3, 2:4));
disp('');

disp('========================================');
disp('DEMO COMPLETED SUCCESSFULLY!');
disp('========================================');