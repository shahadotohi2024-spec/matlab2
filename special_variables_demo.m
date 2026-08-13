% ============================================
% SPECIAL VARIABLES AND CONSTANTS DEMO
% ============================================
clear all;
clc;

disp('========================================');
disp('SPECIAL VARIABLES AND CONSTANTS DEMO');
disp('========================================');
disp('');

% ============================================
% 1. ans - Most Recent Answer
% ============================================
disp('1. ans - MOST RECENT ANSWER');
disp('----------------------------');

% Perform some calculations
5 + 3
% ans will store the result

disp('After 5 + 3, ans =');
disp(ans);

10 * 2
disp('After 10 * 2, ans =');
disp(ans);

% Using ans in further calculations
result = ans + 5;
disp('ans + 5 =');
disp(result);
disp('');

% ============================================
% 2. pi - Pi Constant
% ============================================
disp('2. pi - PI CONSTANT');
disp('--------------------');

disp('Value of pi:');
disp(pi);
disp('');

% Using pi in calculations
disp('2 * pi =');
disp(2 * pi);
disp('');

disp('sin(pi/2) =');
disp(sin(pi/2));
disp('');

disp('cos(pi) =');
disp(cos(pi));
disp('');

disp('Area of circle with radius 5:');
radius = 5;
area = pi * radius^2;
disp(['Area = ', num2str(area)]);
disp('');

% ============================================
% 3. i, j - Imaginary Unit
% ============================================
disp('3. i, j - IMAGINARY UNIT');
disp('-------------------------');

disp('i (imaginary unit):');
disp(i);
disp('');

disp('j (imaginary unit):');
disp(j);
disp('');

% Complex numbers
z1 = 3 + 4i;
z2 = 5 - 2j;

disp('z1 = 3 + 4i');
disp('z2 = 5 - 2j');
disp('');

disp('z1 + z2 =');
disp(z1 + z2);
disp('');

disp('z1 * z2 =');
disp(z1 * z2);
disp('');

disp('Real part of z1:');
disp(real(z1));
disp('');

disp('Imaginary part of z1:');
disp(imag(z1));
disp('');

disp('Magnitude of z1:');
disp(abs(z1));
disp('');

disp('Phase angle of z1:');
disp(angle(z1) * 180/pi);
disp('');

% ============================================
% 4. NaN - Not a Number
% ============================================
disp('4. NaN - NOT A NUMBER');
disp('----------------------');

% Division by zero gives Inf, not NaN in MATLAB/Octave
% NaN typically comes from 0/0 or Inf/Inf
disp('0/0 =');
disp(0/0);
disp('');

disp('Inf/Inf =');
disp(Inf/Inf);
disp('');

% Creating NaN values
nan_array = [1 2 NaN 4 5];
disp('Array with NaN:');
disp(nan_array);
disp('');

% Checking for NaN
disp('isnan(nan_array):');
disp(isnan(nan_array));
disp('');

% Removing NaN values
clean_array = nan_array(~isnan(nan_array));
disp('Array after removing NaN:');
disp(clean_array);
disp('');

% ============================================
% 5. Inf - Infinity
% ============================================
disp('5. Inf - INFINITY');
disp('------------------');

disp('1/0 =');
disp(1/0);
disp('');

disp('-1/0 =');
disp(-1/0);
disp('');

disp('10^1000 = (Overflow gives Inf)');
disp(10^1000);
disp('');

% Using Inf
x = [1 2 3 4 5];
x(3) = Inf;
disp('Array with Inf:');
disp(x);
disp('');

disp('isinf(x):');
disp(isinf(x));
disp('');

% Operations with Inf
disp('Inf + 5 =');
disp(Inf + 5);
disp('');

disp('Inf * 2 =');
disp(Inf * 2);
disp('');

disp('Inf - Inf =');
disp(Inf - Inf);
disp('');

% ============================================
% 6. eps - Floating-Point Relative Accuracy
% ============================================
disp('6. eps - FLOATING-POINT RELATIVE ACCURACY');
disp('------------------------------------------');

disp('Value of eps:');
disp(eps);
disp('');

disp('eps (double precision):');
disp(eps('double'));
disp('');

disp('eps (single precision):');
disp(eps('single'));
disp('');

% Demonstrating eps
a = 1;
b = 1 + eps;
disp('a = 1');
disp('b = 1 + eps');
disp('');

% Checking equality
disp('a == b (Are they equal?)');
disp(a == b);
disp('');

% Difference
disp('b - a =');
disp(b - a);
disp('');

% Machine epsilon for different values
disp('eps(1) =');
disp(eps(1));
disp('');

disp('eps(10) =');
disp(eps(10));
disp('');

disp('eps(100) =');
disp(eps(100));
disp('');

% ============================================
% 7. PRACTICAL EXAMPLE - Using All Special Variables
% ============================================
disp('7. PRACTICAL EXAMPLE');
disp('---------------------');

% Complex number operations with pi
theta = pi/4;
z = exp(i * theta);
disp('z = exp(i * pi/4)');
disp('z =');
disp(z);
disp('');

% Using eps for comparison
x = 0.1 + 0.2;
y = 0.3;
disp('x = 0.1 + 0.2 =');
disp(x);
disp('y = 0.3 =');
disp(y);
disp('');

% Tolerance comparison
tolerance = 1e-10;
if abs(x - y) < tolerance
    disp('x and y are approximately equal (within tolerance)');
else
    disp('x and y are not equal');
end
disp('');

% Matrix with special values
M = [1 2 NaN; 4 Inf 6; 7 8 9];
disp('Matrix with special values:');
disp(M);
disp('');

disp('Sum of matrix (ignoring NaN and Inf?):');
disp(sum(sum(M(~isinf(M) & ~isnan(M)))));
disp('');

disp('========================================');
disp('DEMO COMPLETED SUCCESSFULLY!');
disp('========================================');