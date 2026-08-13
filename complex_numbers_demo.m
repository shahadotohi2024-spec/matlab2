% ============================================
% COMPLEX NUMBERS DEMO
% ============================================
clear all;
clc;

disp('========================================');
disp('COMPLEX NUMBERS DEMO');
disp('========================================');
disp('');

% ============================================
% 1. IMAGINARY UNIT (i, j)
% ============================================
disp('1. IMAGINARY UNIT (i, j)');
disp('-------------------------');

% Using i as imaginary unit
z1 = 3 + 4i;
disp('z1 = 3 + 4i');
disp(z1);
disp('');

% Using j as imaginary unit
z2 = 5 - 2j;
disp('z2 = 5 - 2j');
disp(z2);
disp('');

% Multiple ways to define complex numbers
z3 = complex(2, 3);
disp('z3 = complex(2, 3)');
disp(z3);
disp('');

z4 = 6 + 7*1i;
disp('z4 = 6 + 7*1i');
disp(z4);
disp('');

% ============================================
% 2. REAL PART (real)
% ============================================
disp('2. REAL PART (real)');
disp('---------------------');

z = 3 + 4i;
disp('z = 3 + 4i');
disp('');

real_part = real(z);
disp('real(z) =');
disp(real_part);
disp('');

% ============================================
% 3. IMAGINARY PART (imag)
% ============================================
disp('3. IMAGINARY PART (imag)');
disp('--------------------------');

imag_part = imag(z);
disp('imag(z) =');
disp(imag_part);
disp('');

% ============================================
% 4. PHASE ANGLE (angle)
% ============================================
disp('4. PHASE ANGLE (angle)');
disp('------------------------');

z = 3 + 4i;
disp('z = 3 + 4i');
disp('');

% Angle in radians
angle_rad = angle(z);
disp('angle(z) in radians:');
disp(angle_rad);
disp('');

% Angle in degrees
angle_deg = angle(z) * 180 / pi;
disp('angle(z) in degrees:');
disp(angle_deg);
disp('');

% Examples with different complex numbers
z5 = -1 + 0i;
disp('z5 = -1 + 0i');
disp('angle(z5) in degrees:');
disp(angle(z5) * 180 / pi);
disp('');

z6 = 0 - 1i;
disp('z6 = 0 - 1i');
disp('angle(z6) in degrees:');
disp(angle(z6) * 180 / pi);
disp('');

% ============================================
% 5. COMPLEX CONJUGATE (conj)
% ============================================
disp('5. COMPLEX CONJUGATE (conj)');
disp('-----------------------------');

z = 3 + 4i;
disp('z = 3 + 4i');
disp('');

z_conj = conj(z);
disp('conj(z) =');
disp(z_conj);
disp('');

% Verify: z * conj(z) = |z|^2
product = z * conj(z);
disp('z * conj(z) =');
disp(product);
disp('');

magnitude_squared = abs(z)^2;
disp('|z|^2 =');
disp(magnitude_squared);
disp('');

% ============================================
% 6. CHECK IF REAL (isreal)
% ============================================
disp('6. CHECK IF REAL (isreal)');
disp('---------------------------');

z_real = 5;
z_complex = 3 + 4i;

disp('z_real = 5');
disp('z_complex = 3 + 4i');
disp('');

disp('isreal(z_real):');
disp(isreal(z_real));
disp('');

disp('isreal(z_complex):');
disp(isreal(z_complex));
disp('');

% Array with both real and complex
arr = [1, 2+3i, 4, 5-2i];
disp('arr = [1, 2+3i, 4, 5-2i]');
disp('isreal(arr):');
disp(isreal(arr));
disp('');

% ============================================
% 7. COMPLEX OPERATIONS
% ============================================
disp('7. COMPLEX OPERATIONS');
disp('-----------------------');

z1 = 3 + 4i;
z2 = 2 - 3i;

disp('z1 = 3 + 4i');
disp('z2 = 2 - 3i');
disp('');

% Addition
disp('z1 + z2 =');
disp(z1 + z2);
disp('');

% Subtraction
disp('z1 - z2 =');
disp(z1 - z2);
disp('');

% Multiplication
disp('z1 * z2 =');
disp(z1 * z2);
disp('');

% Division
disp('z1 / z2 =');
disp(z1 / z2);
disp('');

% ============================================
% 8. MAGNITUDE AND PHASE
% ============================================
disp('8. MAGNITUDE AND PHASE');
disp('------------------------');

z = 3 + 4i;
disp('z = 3 + 4i');
disp('');

% Magnitude (absolute value)
mag = abs(z);
disp('|z| =');
disp(mag);
disp('');

% Phase (angle)
phase = angle(z);
disp('phase(z) in radians:');
disp(phase);
disp('');

% Polar form: z = r * exp(i*theta)
r = abs(z);
theta = angle(z);
z_polar = r * exp(i * theta);
disp('z = r * exp(i*theta)');
disp('r =');
disp(r);
disp('theta =');
disp(theta);
disp('z_polar =');
disp(z_polar);
disp('');

% ============================================
% 9. PRACTICAL EXAMPLE - Euler's Formula
% ============================================
disp('9. PRACTICAL EXAMPLE - EULER''S FORMULA');
disp('---------------------------------------');

% Euler's formula: e^(i*theta) = cos(theta) + i*sin(theta)
theta = pi/4;

euler_result = exp(i * theta);
cos_sin_result = cos(theta) + i * sin(theta);

disp(['theta = pi/4 = ', num2str(theta)]);
disp('');

disp('e^(i*theta) =');
disp(euler_result);
disp('');

disp('cos(theta) + i*sin(theta) =');
disp(cos_sin_result);
disp('');

% ============================================
% 10. PRACTICAL EXAMPLE - Roots of Unity
% ============================================
disp('10. PRACTICAL EXAMPLE - ROOTS OF UNITY');
disp('---------------------------------------');

n = 5;
disp(['n = ', num2str(n)]);
disp('');

roots_of_unity = exp(2 * pi * i * (0:n-1) / n);
disp('Roots of unity:');
disp(roots_of_unity);
disp('');

% ============================================
% 11. PRACTICAL EXAMPLE - Complex Matrix
% ============================================
disp('11. PRACTICAL EXAMPLE - COMPLEX MATRIX');
disp('---------------------------------------');

% Create a complex matrix
M = [1+2i, 3-4i, 5+6i; 7-8i, 9+10i, 11-12i];
disp('Complex Matrix M:');
disp(M);
disp('');

% Real and imaginary parts
disp('Real part of M:');
disp(real(M));
disp('');

disp('Imaginary part of M:');
disp(imag(M));
disp('');

% Conjugate transpose
disp("M' (Conjugate transpose):");
disp(M');
disp('');

% ============================================
% 12. PLOTTING COMPLEX NUMBERS
% ============================================
disp('12. PLOTTING COMPLEX NUMBERS');
disp('-----------------------------');

% Create complex points
z_points = [1+2i, 3-1i, -2+3i, -1-2i, 4+1i];

disp('z_points = [1+2i, 3-1i, -2+3i, -1-2i, 4+1i]');
disp('');

% Plot complex numbers
figure;
plot(real(z_points), imag(z_points), 'ro', 'MarkerSize', 10, 'LineWidth', 2);
hold on;
grid on;

% Add labels for each point
for k = 1:length(z_points)
    text(real(z_points(k)) + 0.1, imag(z_points(k)) + 0.1, ...
         ['z', num2str(k)], 'FontSize', 12);
end

xlabel('Real');
ylabel('Imaginary');
title('Complex Numbers in the Complex Plane');
axis equal;
hold off;

disp('Complex number plot created successfully!');
disp('');

% ============================================
% 13. SUMMARY TABLE
% ============================================
disp('13. SUMMARY TABLE');
disp('------------------');
disp('Function    | Description                          | Example');
disp('------------+--------------------------------------+------------------');
disp('real(z)     | Real part of complex number          | real(3+4i) = 3');
disp('imag(z)     | Imaginary part of complex number     | imag(3+4i) = 4');
disp('angle(z)    | Phase angle in radians               | angle(3+4i) = 0.9273');
disp('conj(z)     | Complex conjugate                    | conj(3+4i) = 3-4i');
disp('isreal(z)   | Check if array is real              | isreal(5) = true');
disp('abs(z)      | Magnitude of complex number          | abs(3+4i) = 5');
disp('');

disp('========================================');
disp('DEMO COMPLETED SUCCESSFULLY!');
disp('========================================');