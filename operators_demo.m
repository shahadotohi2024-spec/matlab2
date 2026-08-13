% ============================================
% Operators and Special Characters Demo
% ============================================
clear all;
clc;

disp('========================================');
disp('OPERATORS AND SPECIAL CHARACTERS DEMO');
disp('========================================');
disp('');

% ============================================
% 1. MATRIX MATH OPERATIONS (+, -, *, /)
% ============================================
disp('1. MATRIX MATH OPERATIONS');
disp('--------------------------');

A = [1 2; 3 4];
B = [5 6; 7 8];

disp('Matrix A:');
disp(A);
disp('Matrix B:');
disp(B);

disp('A + B (Addition):');
disp(A + B);

disp('A - B (Subtraction):');
disp(A - B);

disp('A * B (Matrix Multiplication):');
disp(A * B);

disp('A / B (Right Division):');
disp(A / B);

disp('');

% ============================================
% 2. ELEMENT-WISE OPERATIONS (.*, ./)
% ============================================
disp('2. ELEMENT-WISE OPERATIONS');
disp('---------------------------');

C = [1 2 3; 4 5 6];
D = [7 8 9; 10 11 12];

disp('Matrix C:');
disp(C);
disp('Matrix D:');
disp(D);

disp('C .* D (Element-wise Multiplication):');
disp(C .* D);

disp('C ./ D (Element-wise Division):');
disp(C ./ D);

disp('C .^ 2 (Element-wise Power):');
disp(C .^ 2);

disp('');

% ============================================
% 3. MATRIX AND ARRAY POWER (^, .^)
% ============================================
disp('3. MATRIX AND ARRAY POWER');
disp('--------------------------');

E = [1 2; 3 4];

disp('Matrix E:');
disp(E);

disp('E ^ 2 (Matrix Power - E * E):');
disp(E ^ 2);

disp('E .^ 2 (Element-wise Power):');
disp(E .^ 2);

disp('');

% ============================================
% 4. TRANSPOSE (.', ')
% ============================================
disp('4. TRANSPOSE');
disp('-------------');

F = [1+2i 3+4i; 5+6i 7+8i];

disp('Matrix F (Complex):');
disp(F);

disp("F' (Complex Conjugate Transpose):");
disp(F');

disp("F.' (Normal Transpose - No Conjugate):");
disp(F.');

disp('');

% ============================================
% 5. RELATIONAL OPERATORS (==, ~=, <, >, <=, >=)
% ============================================
disp('5. RELATIONAL OPERATORS');
disp('------------------------');

G = [1 2 3; 4 5 6; 7 8 9];
H = [1 3 3; 4 6 6; 7 9 9];

disp('Matrix G:');
disp(G);
disp('Matrix H:');
disp(H);

disp('G == H (Equal to):');
disp(G == H);

disp('G ~= H (Not equal to):');
disp(G ~= H);

disp('G > H (Greater than):');
disp(G > H);

disp('G < H (Less than):');
disp(G < H);

disp('G >= H (Greater than or equal):');
disp(G >= H);

disp('G <= H (Less than or equal):');
disp(G <= H);

disp('');

% ============================================
% 6. LOGICAL OPERATIONS (&&, ||, ~, xor)
% ============================================
disp('6. LOGICAL OPERATIONS');
disp('----------------------');

x = 5;
y = 10;

disp(['x = ', num2str(x)]);
disp(['y = ', num2str(y)]);

disp('x > 3 && y < 15 (AND):');
disp(x > 3 && y < 15);

disp('x > 3 && y > 15 (AND):');
disp(x > 3 && y > 15);

disp('x > 3 || y < 5 (OR):');
disp(x > 3 || y < 5);

disp('~(x > 3) (NOT):');
disp(~(x > 3));

disp('xor(x > 3, y < 5) (XOR):');
disp(xor(x > 3, y < 5));

disp('');

% ============================================
% 7. SUPPRESS OUTPUT (;)
% ============================================
disp('7. SUPPRESS OUTPUT (;)');
disp('-----------------------');

disp('Without semicolon:');
a = 10  % This will display output

disp('With semicolon:');
b = 20; % This will NOT display output

disp('');

% ============================================
% 8. COMMENTS (%) and LINE CONTINUATION (...)
% ============================================
disp('8. COMMENTS AND LINE CONTINUATION');
disp('----------------------------------');

% This is a single line comment

% This is a multi-line comment
% Using multiple percent signs

disp('Long equation with line continuation:');
result = 1 + 2 + 3 + 4 + 5 + ...
         6 + 7 + 8 + 9 + 10;
disp(['Sum = ', num2str(result)]);

disp('');

% ============================================
% 9. CHARACTER VECTORS AND STRINGS (' ', " ")
% ============================================
disp('9. CHARACTER VECTORS AND STRINGS');
disp('--------------------------------');

char_vec = 'Hello World';
str = "Hello World";

disp("Character vector (single quotes):");
disp(char_vec);

disp("String (double quotes):");
disp(str);

disp('');

% ============================================
% 10. STRING APPEND (str1 + str2)
% ============================================
disp('10. STRING APPEND');
disp('------------------');

first_name = 'John';
last_name = 'Doe';
full_name = first_name + " " + last_name;

disp("First name:");
disp(first_name);
disp("Last name:");
disp(last_name);
disp("Full name (appended):");
disp(full_name);

% More string operations
greeting = "Hello";
name = "Alice";
message = greeting + ", " + name + "!";
disp("Message:");
disp(message);

disp('');
disp('========================================');
disp('DEMO COMPLETED SUCCESSFULLY!');
disp('========================================');