clc;
clear all;
close all;

% Time vector
t = 0:0.005:20;

% Message Signal (sine wave)
x = sin(t);

% Figure with three subplots
figure(1);

% 1st subplot: Message Signal
subplot(3,1,1);
plot(t, x, 'black', 'LineWidth', 1.5);
title('Message Signal');
xlabel('Time(s) ---->');
ylabel('Amplitude(V) ---->');
grid on;
ylim([-1.5 1.5]);

% Quantization Parameters
num_levels = 16;    % 4-bit quantization (16 levels)
min_val = -1.2;
max_val = 1.2;
step_size = (max_val - min_val) / num_levels;

% Quantize the signal
quants = zeros(size(x));
for i = 1:length(x)
    % Find quantization level index
    level = round((x(i) - min_val) / step_size);
    % Clamp to valid range [0, num_levels-1]
    level = max(0, min(num_levels-1, level));
    % Get quantized value (midpoint of each level)
    quants(i) = min_val + level * step_size + step_size/2;
end

% 2nd subplot: Quantized Signal
subplot(3,1,2);
stairs(t, quants, 'blue', 'LineWidth', 1.5);
title('Quantized Signal');
xlabel('Time(s) ---->');
ylabel('Amplitude(V) ---->');
grid on;
ylim([-1.5 1.5]);

% PCM Encoding (5-bit)
num_bits = 5;  % 5-bit PCM gives 32 levels

% Normalize quantized values to range [0, 2^num_bits - 1]
min_quant = min(quants);
max_quant = max(quants);
range_quant = max_quant - min_quant;

if range_quant == 0
    normalized = zeros(size(quants));
else
    normalized = (quants - min_quant) / range_quant;
end

% Scale to PCM values (0 to 31 for 5-bit)
pcm_values = round(normalized * (2^num_bits - 1));

% Convert to binary and create PCM signal for visualization
% We'll create a multi-level PCM representation
pcm_signal = zeros(size(t));
for i = 1:length(t)
    % Get binary representation
    binary = dec2bin(pcm_values(i), num_bits);
    % For visualization, convert binary to a numeric value
    % This will show the PCM code as a number between 0 and 31
    pcm_signal(i) = bin2dec(binary);
end

% 3rd subplot: PCM Signal
subplot(3,1,3);
stairs(t, pcm_signal, 'red', 'LineWidth', 1.5);
title('PCM Signal');
xlabel('Time(s) ---->');
ylabel('Amplitude(V) ---->');
grid on;
ylim([-1 33]);

% Display PCM values for first 20 samples
fprintf('\n========================================\n');
fprintf('PCM ENCODING (First 20 samples)\n');
fprintf('========================================\n');
fprintf('Sample No.  Original  Quantized  PCM Code (Binary)\n');
fprintf('----------  --------  ---------  -----------------\n');

for i = 1:min(20, length(x))
    binary = dec2bin(pcm_values(i), num_bits);
    fprintf('%10d  %8.3f  %9.3f  %s\n', ...
            i, x(i), quants(i), binary);
end

fprintf('\n========================================\n');
fprintf('PCM SYSTEM PARAMETERS\n');
fprintf('========================================\n');
fprintf('Number of Quantization Levels: %d\n', num_levels);
fprintf('Number of PCM Bits: %d\n', num_bits);
fprintf('Total Samples: %d\n', length(x));
fprintf('Total Bits Transmitted: %d bits\n', length(x) * num_bits);
fprintf('Min PCM Value: %d\n', min(pcm_values));
fprintf('Max PCM Value: %d\n', max(pcm_values));