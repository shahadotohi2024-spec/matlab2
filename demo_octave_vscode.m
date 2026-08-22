clear all; clc;

% --- Configure graphics toolkit to avoid warnings ---
try
    graphics_toolkit('qt');  % Try using Qt first (recommended)
    disp('✅ Using Qt graphics toolkit');
catch
    try
        graphics_toolkit('gnuplot');  % Fallback to gnuplot
        disp('⚠️ Using gnuplot graphics toolkit');
    catch
        disp('⚠️ No graphics toolkit found');
    end
end

% --- Disable warnings temporarily ---
warning('off', 'all');

disp('╔════════════════════════════════════════╗');
disp('║     ELEMENTARY FUNCTIONS DEMO         ║');
disp('╚════════════════════════════════════════╝');
disp('');

% --- Section 1: Basic Math ---

disp('📐 Basic Math Operations:');
disp('─────────────────────────────────────────');
a = 10; b = 3;
fprintf('a = %d, b = %d\n', a, b);
fprintf('a + b = %d\n', a + b);
fprintf('a - b = %d\n', a - b);
fprintf('a * b = %d\n', a * b);
fprintf('a / b = %.2f\n', a / b);
fprintf('a ^ b = %.0f\n', a^b);
fprintf('a mod b = %d\n', mod(a,b));
disp('');

% --- Section 2: Array Operations ---

disp('📊 Array Operations:');
disp('─────────────────────────────────────────');
x = [1, 2, 3, 4, 5];
y = x.^2;  % Element-wise square
z = x * 2; % Scalar multiplication
disp('x = [1, 2, 3, 4, 5]');
disp('x^2 =');
disp(y);
disp('2x =');
disp(z);

% --- Multiple arrays ---
x2 = [6, 7, 8, 9, 10];
y2 = x + x2;  % Element-wise addition
disp('x2 = [6, 7, 8, 9, 10]');
disp('x + x2 =');
disp(y2);
disp('');

% --- Section 3: Trigonometric & Logarithmic Functions ---

disp('🔬 Trigonometric & Logarithmic Functions:');
disp('─────────────────────────────────────────');
% Avoiding tan(π/2) which gives infinity
angles = [0, pi/6, pi/4, pi/3];
fprintf('Angle (rad)\tSin\t\tCos\t\tTan\n');
fprintf('─────────────────────────────────────────────────\n');
for i = 1:length(angles)
    fprintf('%.2f\t\t%.4f\t\t%.4f\t\t%.4f\n', ...
        angles(i), sin(angles(i)), cos(angles(i)), tan(angles(i)));
end
% Show π/2 separately
fprintf('%.2f\t\t%.4f\t\t%.4f\t\tInfinity\n', pi/2, sin(pi/2), cos(pi/2));
disp('');

disp('📐 Special Functions:');
disp('─────────────────────────────────────────');
fprintf('exp(1) = %.5f\n', exp(1));
fprintf('log(e) = %.5f\n', log(exp(1)));
fprintf('log10(100) = %.2f\n', log10(100));
fprintf('√16 = %.2f\n', sqrt(16));
fprintf('16^(1/2) = %.2f\n', 16^(1/2));
fprintf('factorial(5) = %d\n', factorial(5));
disp('');

% --- Section 4: Complex Numbers ---

disp('🔢 Complex Numbers:');
disp('─────────────────────────────────────────');
z1 = 3 + 4i;
z2 = 1 - 2i;
fprintf('z1 = %.1f + %.1fi\n', real(z1), imag(z1));
fprintf('z2 = %.1f + %.1fi\n', real(z2), imag(z2));
fprintf('z1 + z2 = %.1f + %.1fi\n', real(z1+z2), imag(z1+z2));
fprintf('z1 * z2 = %.1f + %.1fi\n', real(z1*z2), imag(z1*z2));
fprintf('|z1| (Modulus) = %.2f\n', abs(z1));
fprintf('angle(z1) = %.2f rad\n', angle(z1));
disp('');

% --- Section 5: Matrix Operations ---

disp('📈 Matrix Operations:');
disp('─────────────────────────────────────────');
A = [1 2 3; 4 5 6; 7 8 10];
B = [1 0 0; 0 1 0; 0 0 1];
disp('Matrix A:');
disp(A);
disp('Matrix B (Identity):');
disp(B);
disp('A * B =');
disp(A * B);
disp('det(A) (Determinant) =');
disp(det(A));
disp('inv(A) (Inverse) =');
try
    disp(inv(A));
catch
    disp('Matrix A is singular or near singular');
end
disp('');

% --- Section 6: Plot Generation ---

disp('📊 Plot Generation:');
disp('─────────────────────────────────────────');
try
    % Create figure with better position
    figure('Position', [100, 100, 900, 600]);
    
    % Plot 1: Sine and Cosine waves
    t = 0:0.01:2*pi;
    y_sin = sin(t);
    y_cos = cos(t);
    
    subplot(2,2,1);
    plot(t, y_sin, 'r-', 'LineWidth', 2);
    hold on;
    plot(t, y_cos, 'b--', 'LineWidth', 2);
    grid on;
    xlabel('Time (s)');
    ylabel('Amplitude');
    title('Sine and Cosine Waves');
    legend('sin(t)', 'cos(t)', 'Location', 'northeast');
    hold off;
    
    % Plot 2: Exponential function
    subplot(2,2,2);
    t2 = 0:0.1:5;
    y_exp = exp(t2);
    plot(t2, y_exp, 'g-', 'LineWidth', 2);
    grid on;
    xlabel('Time (s)');
    ylabel('e^t');
    title('Exponential Growth');
    
    % Plot 3: Parabola
    subplot(2,2,3);
    x3 = -5:0.1:5;
    y3 = x3.^2;
    plot(x3, y3, 'm-', 'LineWidth', 2);
    grid on;
    xlabel('x');
    ylabel('x^2');
    title('Parabola');
    
    % Plot 4: Histogram of random data
    subplot(2,2,4);
    data_rand = randn(1, 100);
    hist(data_rand, 15);
    xlabel('Value');
    ylabel('Frequency');
    title('Histogram of Random Data');
    grid on;
    
    disp('✅ Plot generated successfully');
catch ME
    disp('⚠️ Plot generation failed:');
    disp(['   Error: ', ME.message]);
end
disp('');

% --- Section 7: Statistics ---

disp('📊 Statistics:');
disp('─────────────────────────────────────────');
data = [2.5, 3.1, 4.2, 5.0, 6.8, 7.2, 8.9, 10.1];
fprintf('Data: ');
fprintf('%.2f ', data);
fprintf('\n');
fprintf('Mean: %.2f\n', mean(data));
fprintf('Median: %.2f\n', median(data));
fprintf('Standard Deviation: %.2f\n', std(data));
fprintf('Minimum: %.2f\n', min(data));
fprintf('Maximum: %.2f\n', max(data));
disp('');

% --- Section 8: Logical Operations ---

disp('🔍 Logical Operations:');
disp('─────────────────────────────────────────');
p = 5 > 3;
q = 10 < 7;
fprintf('5 > 3 = %d (True)\n', p);
fprintf('10 < 7 = %d (False)\n', q);
fprintf('(5 > 3) && (10 < 7) = %d\n', p && q);
fprintf('(5 > 3) || (10 < 7) = %d\n', p || q);
fprintf('~(5 > 3) = %d\n', ~p);
disp('');

% --- Section 9: String Operations ---

disp('📝 String Operations:');
disp('─────────────────────────────────────────');
str1 = 'Octave';
str2 = 'Programming';
str3 = [str1, ' ', str2];  % String concatenation
fprintf('String 1: %s\n', str1);
fprintf('String 2: %s\n', str2);
fprintf('Concatenated: %s\n', str3);
fprintf('String length: %d\n', length(str3));
fprintf('Uppercase: %s\n', upper(str1));
fprintf('Lowercase: %s\n', lower(str2));
disp('');

% --- Section 10: Date and Time ---

disp('🕐 Date and Time:');
disp('─────────────────────────────────────────');
fprintf('Current Time: %s\n', datestr(now, 'HH:MM:SS'));
fprintf('Current Date: %s\n', datestr(now, 'dd-mmm-yyyy'));
fprintf('Current Year: %s\n', datestr(now, 'yyyy'));
fprintf('Day of Week: %s\n', datestr(now, 'dddd'));
disp('');

% --- Section 11: File Operations ---

disp('📁 File Operations:');
disp('─────────────────────────────────────────');
try
    % Create a sample file
    filename = 'sample_output.txt';
    fid = fopen(filename, 'w');
    fprintf(fid, 'This is a sample file created by Octave\n');
    fprintf(fid, 'Date: %s\n', datestr(now));
    fprintf(fid, 'Random number: %.4f\n', rand());
    fclose(fid);
    fprintf('✅ File created: %s\n', filename);
    
    % Read the file
    fid = fopen(filename, 'r');
    content = fscanf(fid, '%c');
    fclose(fid);
    fprintf('File content:\n%s\n', content);
    
    % Delete the file
    delete(filename);
    fprintf('✅ File deleted successfully\n');
catch ME
    disp('⚠️ File operation failed:');
    disp(['   Error: ', ME.message]);
end
disp('');

% --- End ---

disp('╔════════════════════════════════════════╗');
disp('║     PROGRAM RUN SUCCESSFULLY          ║');
disp('╚════════════════════════════════════════╝');

% --- Restore warnings ---
warning('on', 'all');

fprintf('\n📌 Tip: Press any key to close the plot window...\n');
pause;