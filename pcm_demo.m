% pcm_demo_fixed.m - Pulse Code Modulation Techniques Demo (Fixed)
clear all; clc;

% --- Graphics toolkit configuration ---
try
    graphics_toolkit('qt');
    disp('✅ Using Qt graphics toolkit');
catch
    try
        graphics_toolkit('gnuplot');
        disp('⚠️ Using gnuplot graphics toolkit');
    catch
        disp('⚠️ No graphics toolkit found - plotting disabled');
    end
end

warning('off', 'all');

disp('╔══════════════════════════════════════════════════════════════╗');
disp('║         PULSE CODE MODULATION (PCM) TECHNIQUES DEMO        ║');
disp('╚══════════════════════════════════════════════════════════════╝');
disp('');

% ============================================================
% SECTION 1: PCM PARAMETERS
% ============================================================
disp('📊 1. PCM PARAMETERS');
disp('───────────────────────────────────────────────────────────────');

% Sampling parameters
fs = 1000;           % Sampling frequency (Hz)
Ts = 1/fs;           % Sampling period (seconds)
duration = 0.1;      % Signal duration (seconds)
t = 0:Ts:duration-Ts; % Time vector

% Quantization parameters
bits = 4;            % Number of bits for quantization
levels = 2^bits;     % Number of quantization levels

fprintf('Sampling Frequency: %d Hz\n', fs);
fprintf('Sampling Period: %.4f seconds\n', Ts);
fprintf('Number of Samples: %d\n', length(t));
fprintf('Quantization Bits: %d\n', bits);
fprintf('Quantization Levels: %d\n', levels);
disp('');

% ============================================================
% SECTION 2: ANALOG SIGNAL GENERATION
% ============================================================
disp('📊 2. ANALOG SIGNAL GENERATION');
disp('───────────────────────────────────────────────────────────────');

% Generate analog signal (combination of sine waves)
f1 = 50;   % Frequency 1 (Hz)
f2 = 120;  % Frequency 2 (Hz)
signal = 2*sin(2*pi*f1*t) + 1.5*cos(2*pi*f2*t);

% Display signal parameters
fprintf('Signal Type: Multi-tone (50Hz + 120Hz)\n');
fprintf('Signal Amplitude Range: %.2f to %.2f\n', min(signal), max(signal));
fprintf('Signal Length: %d samples\n', length(signal));
disp('');

% ============================================================
% SECTION 3: SAMPLING (Analog to Discrete)
% ============================================================
disp('📊 3. SAMPLING (Analog to Discrete)');
disp('───────────────────────────────────────────────────────────────');

% Sample the signal
sampled_signal = signal; % Already sampled at fs

% Display sampling information
fprintf('Sampling Rate: %d samples/second\n', fs);
fprintf('Nyquist Rate: %d Hz\n', 2*max([f1, f2]));
fprintf('Sampling is adequate (fs > 2*fmax)\n');
disp('');

% ============================================================
% SECTION 4: QUANTIZATION
% ============================================================
disp('📊 4. QUANTIZATION (Discrete to Digital)');
disp('───────────────────────────────────────────────────────────────');

% Find signal range
signal_min = min(signal);
signal_max = max(signal);
signal_range = signal_max - signal_min;

% Quantization step size
step_size = signal_range / levels;

% Quantize the signal
quantized_signal = zeros(size(signal));
quant_indices = zeros(size(signal));

for i = 1:length(signal)
    % Quantization index
    idx = round((signal(i) - signal_min) / step_size);
    % Limit to valid range
    if idx < 0
        idx = 0;
    elseif idx >= levels
        idx = levels - 1;
    end
    quant_indices(i) = idx;
    % Reconstructed value
    quantized_signal(i) = signal_min + idx * step_size + step_size/2;
end

% Display quantization information
fprintf('Signal Range: %.3f to %.3f\n', signal_min, signal_max);
fprintf('Quantization Step Size: %.4f\n', step_size);
fprintf('Number of Levels: %d\n', levels);
fprintf('Bits per Sample: %d\n', bits);
disp('');

% ============================================================
% SECTION 5: ENCODING (Digital to Binary)
% ============================================================
disp('📊 5. ENCODING (Digital to Binary)');
disp('───────────────────────────────────────────────────────────────');

% Encode quantized values to binary
binary_codes = zeros(length(signal), bits);
for i = 1:length(signal)
    idx = quant_indices(i);
    % Convert to binary
    for b = bits:-1:1
        binary_codes(i, bits - b + 1) = bitget(idx, b);
    end
end

% Display first 10 binary codes
fprintf('First 10 samples binary codes:\n');
fprintf('Sample\tValue\t\tBinary Code\n');
fprintf('─────────────────────────────────────────────────\n');
for i = 1:min(10, length(signal))
    fprintf('%d\t%.3f\t\t', i, signal(i));
    for b = 1:bits
        fprintf('%d', binary_codes(i, b));
    end
    fprintf('\n');
end
disp('');

% ============================================================
% SECTION 6: DECODING AND RECONSTRUCTION
% ============================================================
disp('📊 6. DECODING AND RECONSTRUCTION');
disp('───────────────────────────────────────────────────────────────');

% Decode binary to analog
reconstructed_signal = zeros(size(signal));
for i = 1:length(signal)
    % Convert binary to index
    idx = 0;
    for b = 1:bits
        idx = idx + binary_codes(i, b) * 2^(bits - b);
    end
    % Reconstruct analog value
    reconstructed_signal(i) = signal_min + idx * step_size + step_size/2;
end

% Calculate error
quantization_error = signal - reconstructed_signal;

% Display reconstruction quality
fprintf('Reconstruction Error Metrics:\n');
fprintf('Mean Square Error (MSE): %.6f\n', mean(quantization_error.^2));
fprintf('Root Mean Square Error (RMSE): %.6f\n', sqrt(mean(quantization_error.^2)));
fprintf('Signal to Noise Ratio (SNR): %.2f dB\n', ...
    20*log10(rms(signal)/rms(quantization_error)));
fprintf('Peak Signal to Noise Ratio (PSNR): %.2f dB\n', ...
    20*log10(max(signal)/rms(quantization_error)));
disp('');

% ============================================================
% SECTION 7: DIFFERENT QUANTIZATION LEVELS COMPARISON
% ============================================================
disp('📊 7. QUANTIZATION LEVELS COMPARISON');
disp('───────────────────────────────────────────────────────────────');

% Test with different bit depths
bit_depths = [2, 3, 4, 6, 8];
snr_values = zeros(length(bit_depths), 1);

for d = 1:length(bit_depths)
    b = bit_depths(d);
    lvl = 2^b;
    step = signal_range / lvl;
    
    % Quantize and reconstruct
    q_sig = zeros(size(signal));
    for i = 1:length(signal)
        idx = round((signal(i) - signal_min) / step);
        if idx < 0
            idx = 0;
        elseif idx >= lvl
            idx = lvl - 1;
        end
        q_sig(i) = signal_min + idx * step + step/2;
    end
    
    % Calculate SNR
    error = signal - q_sig;
    if rms(error) > 0
        snr_values(d) = 20*log10(rms(signal)/rms(error));
    else
        snr_values(d) = 100; % Infinite SNR
    end
end

% Display comparison
fprintf('%-10s %-15s %-10s\n', 'Bits', 'Levels', 'SNR (dB)');
fprintf('─────────────────────────────────────────────────\n');
for d = 1:length(bit_depths)
    fprintf('%-10d %-15d %-10.2f\n', bit_depths(d), 2^bit_depths(d), snr_values(d));
end
disp('');

% ============================================================
% SECTION 8: PLOT GENERATION
% ============================================================
disp('📊 8. PLOT GENERATION');
disp('───────────────────────────────────────────────────────────────');

try
    % Check if graphics is available
    if isempty(get(0, 'CurrentFigure'))
        figure('Position', [100, 50, 1000, 700]);
    end
    
    % Plot 1: Original Analog Signal
    subplot(3,2,1);
    plot(t, signal, 'b-', 'LineWidth', 1.5);
    grid on;
    xlabel('Time (s)');
    ylabel('Amplitude');
    title('Original Analog Signal');
    
    % Plot 2: Sampled Signal
    subplot(3,2,2);
    stem(t(1:min(100,length(t))), signal(1:min(100,length(t))), 'r-', 'LineWidth', 1.5);
    grid on;
    xlabel('Time (s)');
    ylabel('Amplitude');
    title('Sampled Signal (First 100 samples)');
    
    % Plot 3: Quantized Signal
    subplot(3,2,3);
    plot(t, signal, 'b-', 'LineWidth', 0.5);
    hold on;
    plot(t, quantized_signal, 'r-', 'LineWidth', 1.5);
    grid on;
    xlabel('Time (s)');
    ylabel('Amplitude');
    title('Original vs Quantized Signal');
    legend('Original', 'Quantized', 'Location', 'best');
    hold off;
    
    % Plot 4: Quantization Error
    subplot(3,2,4);
    plot(t, quantization_error, 'g-', 'LineWidth', 1.5);
    grid on;
    xlabel('Time (s)');
    ylabel('Error');
    title('Quantization Error');
    
    % Plot 5: SNR vs Bit Depth
    subplot(3,2,5);
    plot(bit_depths, snr_values, 'm-o', 'LineWidth', 2, 'MarkerSize', 8);
    grid on;
    xlabel('Bit Depth');
    ylabel('SNR (dB)');
    title('SNR vs Bit Depth');
    
    % Plot 6: Binary Code Visualization (First 20 samples)
    subplot(3,2,6);
    imagesc(binary_codes(1:min(20,size(binary_codes,1)), :));
    colormap([1 1 1; 0 0 0]);
    xlabel('Bit Position');
    ylabel('Sample Number');
    title('Binary Codes (First 20 samples)');
    set(gca, 'YTick', 1:min(20,size(binary_codes,1)));
    
    drawnow; % Force display
    disp('✅ Plots generated successfully');
    disp('   (Plot window should appear - check minimized windows)');
    
catch ME
    disp('⚠️ Plot generation failed:');
    disp(['   Error: ', ME.message]);
    disp('   Please run "graphics_toolkit(''gnuplot'')" manually');
end
disp('');

% ============================================================
% SECTION 9: FILE OPERATIONS
% ============================================================
disp('📊 9. FILE OPERATIONS');
disp('───────────────────────────────────────────────────────────────');

% Save PCM data to file
filename = 'pcm_data.txt';
fid = fopen(filename, 'w');
fprintf(fid, 'Pulse Code Modulation Data\n');
fprintf(fid, '==========================\n\n');
fprintf(fid, 'Sampling Frequency: %d Hz\n', fs);
fprintf(fid, 'Bit Depth: %d bits\n', bits);
fprintf(fid, 'Quantization Levels: %d\n', levels);
fprintf(fid, 'Number of Samples: %d\n\n', length(signal));
fprintf(fid, 'Sample\tOriginal\tQuantized\tError\tBinary\n');
fprintf(fid, '─────────────────────────────────────────────────────────\n');

for i = 1:min(20, length(signal))
    fprintf(fid, '%d\t%.4f\t%.4f\t%.4f\t', i, signal(i), quantized_signal(i), quantization_error(i));
    for b = 1:bits
        fprintf(fid, '%d', binary_codes(i, b));
    end
    fprintf(fid, '\n');
end
fclose(fid);

fprintf('✅ Data saved to: %s\n', filename);
disp('');

% ============================================================
% SECTION 10: ADDITIONAL PCM TECHNIQUES (FIXED)
% ============================================================
disp('📊 10. ADDITIONAL PCM TECHNIQUES');
disp('───────────────────────────────────────────────────────────────');

% 10.1: Non-uniform Quantization (Mu-law Companding)
disp('10.1 Mu-law Companding:');
mu = 255; % Mu-law parameter

% Compand (compress) - Fixed version
signal_normalized = signal / max(abs(signal));
signal_companded = sign(signal_normalized) .* (log(1 + mu*abs(signal_normalized))) / log(1 + mu);
fprintf('Mu-law Companding with μ = %d\n', mu);

% Quantize companded signal
step_comp = (max(signal_companded) - min(signal_companded)) / levels;
quant_comp = zeros(size(signal_companded));
for i = 1:length(signal_companded)
    idx = round((signal_companded(i) - min(signal_companded)) / step_comp);
    if idx < 0
        idx = 0;
    elseif idx >= levels
        idx = levels - 1;
    end
    quant_comp(i) = min(signal_companded) + idx * step_comp + step_comp/2;
end

% Expand - Fixed version
signal_expanded = sign(quant_comp) .* (max(abs(signal))/mu) .* ((1+mu).^abs(quant_comp) - 1);
fprintf('Companding reduces quantization error for low amplitude signals\n');
disp('');

% 10.2: Differential PCM (FIXED)
disp('10.2 Differential PCM:');

% Calculate differential signal (fixed)
diff_signal = zeros(size(signal));
diff_signal(1) = signal(1);
for i = 2:length(signal)
    diff_signal(i) = signal(i) - signal(i-1);
end

% Quantize differential signal
step_diff = (max(diff_signal) - min(diff_signal)) / levels;
if step_diff == 0
    step_diff = 0.001; % Prevent division by zero
end

quant_diff = zeros(size(diff_signal));
diff_indices = zeros(size(diff_signal));

for i = 1:length(diff_signal)
    idx = round((diff_signal(i) - min(diff_signal)) / step_diff);
    if idx < 0
        idx = 0;
    elseif idx >= levels
        idx = levels - 1;
    end
    diff_indices(i) = idx;
    quant_diff(i) = min(diff_signal) + idx * step_diff + step_diff/2;
end

% Reconstruct from differential
reconstructed_dpcm = zeros(size(signal));
reconstructed_dpcm(1) = signal(1);
for i = 2:length(signal)
    reconstructed_dpcm(i) = reconstructed_dpcm(i-1) + quant_diff(i);
end

% Calculate DPCM error
dpcm_error = signal - reconstructed_dpcm;
if rms(dpcm_error) > 0
    dpcm_snr = 20*log10(rms(signal)/rms(dpcm_error));
else
    dpcm_snr = 100;
end
fprintf('DPCM SNR: %.2f dB\n', dpcm_snr);
fprintf('DPCM reduces redundancy in the signal\n');
disp('');

% ============================================================
% SECTION 11: PERFORMANCE ANALYSIS
% ============================================================
disp('📊 11. PERFORMANCE ANALYSIS');
disp('───────────────────────────────────────────────────────────────');

% Calculate bit rate
bit_rate = fs * bits;
fprintf('Bit Rate: %d bits/second\n', bit_rate);

% Memory requirements
memory_original = length(signal) * 64; % Assuming 64-bit floating point
memory_pcm = length(signal) * bits;
compression_ratio = memory_original / memory_pcm;

fprintf('Original Signal Memory: %d bits\n', memory_original);
fprintf('PCM Encoded Memory: %d bits\n', memory_pcm);
fprintf('Compression Ratio: %.2f:1\n', compression_ratio);

% Bandwidth requirements
bandwidth = bit_rate / 2;
fprintf('Required Bandwidth: %.2f kHz\n', bandwidth/1000);
disp('');

% ============================================================
% SECTION 12: SUMMARY
% ============================================================
disp('📊 12. PCM TECHNIQUES SUMMARY');
disp('───────────────────────────────────────────────────────────────');

disp('PCM Process Steps:');
disp('  1. Analog Signal (Continuous)');
disp('  2. Sampling (Discrete-time)');
disp('  3. Quantization (Discrete-amplitude)');
disp('  4. Encoding (Binary)');
disp('  5. Transmission');
disp('  6. Decoding');
disp('  7. Reconstruction (Analog)');
disp('');

disp('Key PCM Parameters:');
fprintf('  Sampling Frequency: %d Hz\n', fs);
fprintf('  Bit Depth: %d bits\n', bits);
fprintf('  Quantization Levels: %d\n', levels);
fprintf('  Bit Rate: %d bps\n', bit_rate);
fprintf('  SNR (Uniform Quantization): %.2f dB\n', snr_values(find(bit_depths==bits)));
if exist('dpcm_snr', 'var')
    fprintf('  SNR (DPCM): %.2f dB\n', dpcm_snr);
end
disp('');

% ============================================================
% END
% ============================================================
disp('╔══════════════════════════════════════════════════════════════╗');
disp('║              PCM DEMO RUN SUCCESSFULLY                     ║');
disp('╚══════════════════════════════════════════════════════════════╝');

warning('on', 'all');

% Keep plot window open
fprintf('\n📌 Press any key to close plots...\n');
pause;
close all;