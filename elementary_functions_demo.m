% ============================================
% ELEMENTARY FUNCTIONS DEMO (CONSOLE VERSION)
% ============================================
clear all;
clc;

disp('========================================');
disp('ELEMENTARY FUNCTIONS DEMO');
disp('========================================');
disp('');

% ============================================
% 1. TRIGONOMETRIC FUNCTIONS (RADIANS)
% ============================================
disp('1. TRIGONOMETRIC FUNCTIONS (RADIANS)');
disp('-------------------------------------');

theta = pi/4;
disp(['theta = pi/4 = ', num2str(theta), ' radians']);
disp('');

% Sine and inverse
disp('sin(theta) =');
disp(sin(theta));
disp('');

disp('asin(sin(theta)) =');
disp(asin(sin(theta)));
disp('');

% Cosine
disp('cos(theta) =');
disp(cos(theta));
disp('');

% Tangent
disp('tan(theta) =');
disp(tan(theta));
disp('');

% Cosecant, Secant, Cotangent
disp('csc(theta) = 1/sin(theta) =');
disp(csc(theta));
disp('');

disp('sec(theta) = 1/cos(theta) =');
disp(sec(theta));
disp('');

disp('cot(theta) = 1/tan(theta) =');
disp(cot(theta));
disp('');

% ============================================
% 2. TRIGONOMETRIC FUNCTIONS (DEGREES)
% ============================================
disp('2. TRIGONOMETRIC FUNCTIONS (DEGREES)');
disp('-------------------------------------');

theta_deg = 45;
disp(['theta = ', num2str(theta_deg), ' degrees']);
disp('');

% Sine and inverse in degrees
disp('sind(theta) =');
disp(sind(theta_deg));
disp('');

disp('asind(sind(theta)) =');
disp(asind(sind(theta_deg)));
disp('');

% Cosine in degrees
disp('cosd(theta) =');
disp(cosd(theta_deg));
disp('');

% Tangent in degrees
disp('tand(theta) =');
disp(tand(theta_deg));
disp('');

% ============================================
% 3. HYPERBOLIC FUNCTIONS
% ============================================
disp('3. HYPERBOLIC FUNCTIONS');
disp('-------------------------');

x = 1;
disp(['x = ', num2str(x)]);
disp('');

% Hyperbolic sine
disp('sinh(x) =');
disp(sinh(x));
disp('');

% Hyperbolic cosine
disp('cosh(x) =');
disp(cosh(x));
disp('');

% Hyperbolic tangent
disp('tanh(x) =');
disp(tanh(x));
disp('');

% Inverse hyperbolic
disp('asinh(sinh(x)) =');
disp(asinh(sinh(x)));
disp('');

% ============================================
% 4. ABSOLUTE VALUE (abs)
% ============================================
disp('4. ABSOLUTE VALUE (abs)');
disp('------------------------');

% Absolute value of real numbers
x = -5.7;
disp(['x = ', num2str(x)]);
disp('abs(x) =');
disp(abs(x));
disp('');

% Absolute value of complex numbers (magnitude)
z = 3 + 4i;
disp('z = 3 + 4i');
disp('abs(z) =');
disp(abs(z));
disp('');

% ============================================
% 5. EXPONENTIAL (exp)
% ============================================
disp('5. EXPONENTIAL (exp)');
disp('---------------------');

x = 2;
disp(['x = ', num2str(x)]);
disp('exp(x) =');
disp(exp(x));
disp('');

% Euler's number e
disp('exp(1) = (e)');
disp(exp(1));
disp('');

% ============================================
% 6. SQUARE ROOT AND NTH ROOT
% ============================================
disp('6. SQUARE ROOT AND NTH ROOT');
disp('----------------------------');

x = 16;
disp(['x = ', num2str(x)]);
disp('');

% Square root
disp('sqrt(x) =');
disp(sqrt(x));
disp('');

% nth root
disp('nthroot(x, 4) = (4th root)');
disp(nthroot(x, 4));
disp('');

n = 3;
disp(['nthroot(27, ', num2str(n), ') =']);
disp(nthroot(27, n));
disp('');

% ============================================
% 7. LOGARITHMS
% ============================================
disp('7. LOGARITHMS');
disp('--------------');

x = 100;
disp(['x = ', num2str(x)]);
disp('');

% Natural logarithm (base e)
disp('log(x) = (natural log)');
disp(log(x));
disp('');

% Base 2 logarithm
disp('log2(x) =');
disp(log2(x));
disp('');

% Base 10 logarithm
disp('log10(x) =');
disp(log10(x));
disp('');

% Verify: 10^log10(x) = x
disp('10^log10(x) =');
disp(10^log10(x));
disp('');

% ============================================
% 8. FACTORIAL
% ============================================
disp('8. FACTORIAL');
disp('-------------');

n = 5;
disp(['n = ', num2str(n)]);
disp(['factorial(', num2str(n), ') =']);
disp(factorial(n));
disp('');

% Sequence of factorials
disp('Factorials from 1 to 10:');
for k = 1:10
    fprintf('factorial(%d) = %d\n', k, factorial(k));
end
disp('');

% ============================================
% 9. SIGN FUNCTION
% ============================================
disp('9. SIGN FUNCTION (sign)');
disp('------------------------');

x = [-3, 0, 5];
disp('x = [-3, 0, 5]');
disp('sign(x) =');
disp(sign(x));
disp('');

% ============================================
% 10. MODULO (mod)
% ============================================
disp('10. MODULO (mod)');
disp('------------------');

a = 17;
b = 5;
disp(['a = ', num2str(a), ', b = ', num2str(b)]);
disp(['mod(', num2str(a), ', ', num2str(b), ') =']);
disp(mod(a, b));
disp('');

% ============================================
% 11. ROUNDING FUNCTIONS
% ============================================
disp('11. ROUNDING FUNCTIONS');
disp('-----------------------');

x = 3.7;
disp(['x = ', num2str(x)]);
disp('');

% Ceil (round up)
disp('ceil(x) = (round toward +inf)');
disp(ceil(x));
disp('');

% Floor (round down)
disp('floor(x) = (round toward -inf)');
disp(floor(x));
disp('');

% Fix (round toward zero)
disp('fix(x) = (round toward zero)');
disp(fix(x));
disp('');

% Round (nearest integer)
disp('round(x) =');
disp(round(x));
disp('');

% Negative numbers
x = -3.7;
disp(['x = ', num2str(x)]);
disp('ceil(x) =');
disp(ceil(x));
disp('floor(x) =');
disp(floor(x));
disp('fix(x) =');
disp(fix(x));
disp('round(x) =');
disp(round(x));
disp('');

% ============================================
% 12. PRACTICAL EXAMPLE - Signal Processing (NO PLOTS)
% ============================================
disp('12. PRACTICAL EXAMPLE - SIGNAL PROCESSING');
disp('------------------------------------------');

% Create a signal
t = linspace(0, 4*pi, 100);
signal = sin(t) + 0.5*sin(2*t) + 0.3*sin(3*t);

disp('Signal created successfully!');
disp('First 5 values:');
disp(signal(1:5));
disp('');

% Absolute value of signal
disp('Absolute value (first 5):');
disp(abs(signal(1:5)));
disp('');

% ============================================
% 13. PRACTICAL EXAMPLE - Exponential Decay (NO PLOTS)
% ============================================
disp('13. PRACTICAL EXAMPLE - EXPONENTIAL DECAY');
disp('------------------------------------------');

t = 0:0.1:5;
decay = exp(-t);
disp('Exponential decay: e^(-t)');
disp('First 10 values:');
disp(decay(1:10));
disp('');

% ============================================
% 14. PRACTICAL EXAMPLE - Rounding Demo
% ============================================
disp('14. PRACTICAL EXAMPLE - ROUNDING DEMO');
disp('--------------------------------------');

x_values = [-2.7, -1.5, -0.5, 0.5, 1.5, 2.7];
disp('x_values =');
disp(x_values);
disp('');

disp('Function | -2.7 | -1.5 | -0.5 | 0.5 | 1.5 | 2.7');
disp('---------+------+------+------+-----+-----+-----');

disp(['ceil     | ', num2str(ceil(x_values))]);
disp(['floor    | ', num2str(floor(x_values))]);
disp(['fix      | ', num2str(fix(x_values))]);
disp(['round    | ', num2str(round(x_values))]);
disp('');

disp('========================================');
disp('DEMO COMPLETED SUCCESSFULLY!');
disp('========================================');