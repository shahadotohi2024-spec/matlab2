% digital_modulation_fixed.m - ASK, FSK & PSK Modulation Demo (FIXED)
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
        disp('⚠️ No graphics toolkit found');
    end
end

warning('off', 'all');

disp('╔══════════════════════════════════════════════════════════════╗');
disp('║      ASK, FSK & PSK MODULATION TECHNIQUES DEMO            ║');
disp('╚══════════════════════════════════════════════════════════════╝');
disp('');

% ============================================================
% SECTION 1: PARAMETERS
% ============================================================
disp('📊 1. MODULATION PARAMETERS');
disp('───────────────────────────────────────────────────────────────');

% Digital signal parameters
bit_rate = 2;           % Bits per second
bit_duration = 1/bit_rate; % Duration of each bit
num_bits = 8;           % Number of bits
total_time = num_bits * bit_duration;

% Sampling parameters
fs = 1000;              % Sampling frequency (Hz)
Ts = 1/fs;              % Sampling period
t = 0:Ts:total_time-Ts; % Time vector

% Carrier parameters
fc_ask = 20;            % Carrier frequency for ASK (Hz)
fc_fsk1 = 20;           % Carrier frequency for FSK - bit 0 (Hz)
fc_fsk2 = 40;           % Carrier frequency for FSK - bit 1 (Hz)
fc_psk = 20;            % Carrier frequency for PSK (Hz)

% Generate digital data
data_bits = randi([0, 1], 1, num_bits);
fprintf('Number of Bits: %d\n', num_bits);
fprintf('Bit Rate: %d bps\n', bit_rate);
fprintf('Bit Duration: %.2f seconds\n', bit_duration);
fprintf('Sampling Frequency: %d Hz\n', fs);
fprintf('Carrier Frequencies: ASK=%dHz, FSK0=%dHz, FSK1=%dHz, PSK=%dHz\n', ...
    fc_ask, fc_fsk1, fc_fsk2, fc_psk);
disp('');

% Display data bits
disp('Data Bits:');
fprintf('%d ', data_bits);
fprintf('\n\n');

% ============================================================
% SECTION 2: GENERATE DIGITAL SIGNAL (NRZ)
% ============================================================
disp('📊 2. GENERATING DIGITAL SIGNAL');
disp('───────────────────────────────────────────────────────────────');

% Generate NRZ signal (Non-Return to Zero)
digital_signal = zeros(1, length(t));
for i = 1:num_bits
    start_idx = (i-1) * bit_duration * fs + 1;
    end_idx = i * bit_duration * fs;
    if end_idx > length(t)
        end_idx = length(t);
    end
    if data_bits(i) == 1
        digital_signal(start_idx:end_idx) = 1;
    else
        digital_signal(start_idx:end_idx) = -1;
    end
end

disp('✅ Digital signal generated');
disp('');

% ============================================================
% SECTION 3: AMPLITUDE SHIFT KEYING (ASK)
% ============================================================
disp('📊 3. AMPLITUDE SHIFT KEYING (ASK)');
disp('───────────────────────────────────────────────────────────────');

% Generate ASK modulated signal
carrier_ask = cos(2*pi*fc_ask*t);
ask_modulated = (digital_signal + 1)/2 .* carrier_ask; % Unipolar for OOK

% Display ASK parameters
fprintf('Carrier Frequency: %d Hz\n', fc_ask);
fprintf('Modulation Type: On-Off Keying (OOK)\n');
fprintf('Bit 1: Carrier ON (Amplitude = 1)\n');
fprintf('Bit 0: Carrier OFF (Amplitude = 0)\n');
disp('');

% ============================================================
% SECTION 4: FREQUENCY SHIFT KEYING (FSK)
% ============================================================
disp('📊 4. FREQUENCY SHIFT KEYING (FSK)');
disp('───────────────────────────────────────────────────────────────');

% Generate FSK modulated signal
fsk_modulated = zeros(1, length(t));
carrier_fsk1 = cos(2*pi*fc_fsk1*t);
carrier_fsk2 = cos(2*pi*fc_fsk2*t);

for i = 1:num_bits
    start_idx = (i-1) * bit_duration * fs + 1;
    end_idx = i * bit_duration * fs;
    if end_idx > length(t)
        end_idx = length(t);
    end
    if data_bits(i) == 1
        fsk_modulated(start_idx:end_idx) = carrier_fsk2(start_idx:end_idx);
    else
        fsk_modulated(start_idx:end_idx) = carrier_fsk1(start_idx:end_idx);
    end
end

% Display FSK parameters
fprintf('Frequency for Bit 0: %d Hz\n', fc_fsk1);
fprintf('Frequency for Bit 1: %d Hz\n', fc_fsk2);
fprintf('Frequency Deviation: %d Hz\n', fc_fsk2 - fc_fsk1);
fprintf('Modulation Type: Frequency Shift Keying\n');
disp('');

% ============================================================
% SECTION 5: PHASE SHIFT KEYING (PSK)
% ============================================================
disp('📊 5. PHASE SHIFT KEYING (PSK)');
disp('───────────────────────────────────────────────────────────────');

% Generate PSK modulated signal
psk_modulated = zeros(1, length(t));

for i = 1:num_bits
    start_idx = (i-1) * bit_duration * fs + 1;
    end_idx = i * bit_duration * fs;
    if end_idx > length(t)
        end_idx = length(t);
    end
    if data_bits(i) == 1
        psk_modulated(start_idx:end_idx) = cos(2*pi*fc_psk*t(start_idx:end_idx));
    else
        psk_modulated(start_idx:end_idx) = cos(2*pi*fc_psk*t(start_idx:end_idx) + pi);
    end
end

% Display PSK parameters
fprintf('Carrier Frequency: %d Hz\n', fc_psk);
fprintf('Modulation Type: Binary Phase Shift Keying (BPSK)\n');
fprintf('Bit 1: 0° Phase Shift\n');
fprintf('Bit 0: 180° Phase Shift\n');
disp('');

% ============================================================
% SECTION 6: PLOT GENERATION
% ============================================================
disp('📊 6. PLOT GENERATION');
disp('───────────────────────────────────────────────────────────────');

try
    figure('Position', [50, 50, 1200, 800]);
    
    % Plot 1: Data Bits
    subplot(5,1,1);
    stairs(0:bit_duration:total_time, [data_bits, data_bits(end)], 'b-', 'LineWidth', 2);
    grid on;
    xlabel('Time (s)');
    ylabel('Amplitude');
    title('Original Data Bits');
    axis([0 total_time -0.5 1.5]);
    set(gca, 'YTick', [0 1]);
    
    % Plot 2: Digital Signal (NRZ)
    subplot(5,1,2);
    plot(t, digital_signal, 'r-', 'LineWidth', 1.5);
    grid on;
    xlabel('Time (s)');
    ylabel('Amplitude');
    title('Digital Signal (NRZ)');
    axis([0 total_time -1.5 1.5]);
    
    % Plot 3: ASK Modulated Signal
    subplot(5,1,3);
    plot(t, ask_modulated, 'g-', 'LineWidth', 1);
    grid on;
    xlabel('Time (s)');
    ylabel('Amplitude');
    title('ASK Modulated Signal');
    axis([0 total_time -1.5 1.5]);
    
    % Plot 4: FSK Modulated Signal
    subplot(5,1,4);
    plot(t, fsk_modulated, 'm-', 'LineWidth', 1);
    grid on;
    xlabel('Time (s)');
    ylabel('Amplitude');
    title('FSK Modulated Signal');
    axis([0 total_time -1.5 1.5]);
    
    % Plot 5: PSK Modulated Signal
    subplot(5,1,5);
    plot(t, psk_modulated, 'c-', 'LineWidth', 1);
    grid on;
    xlabel('Time (s)');
    ylabel('Amplitude');
    title('PSK Modulated Signal');
    axis([0 total_time -1.5 1.5]);
    
    drawnow;
    disp('✅ Plots generated successfully');
    
catch ME
    disp('⚠️ Plot generation failed:');
    disp(['   Error: ', ME.message]);
end
disp('');

% ============================================================
% SECTION 7: DEMODULATION (FIXED)
% ============================================================
disp('📊 7. DEMODULATION (Simple Detection)');
disp('───────────────────────────────────────────────────────────────');

% --- ASK Demodulation (Envelope Detection) ---
ask_demodulated_bits = zeros(1, num_bits);
ask_demod_signal = abs(ask_modulated); % Envelope detection
threshold_ask = 0.5;

for i = 1:num_bits
    start_idx = (i-1) * bit_duration * fs + 1;
    end_idx = i * bit_duration * fs;
    if end_idx > length(t)
        end_idx = length(t);
    end
    segment = ask_demod_signal(start_idx:end_idx);
    avg_value = mean(segment);
    if avg_value > threshold_ask
        ask_demodulated_bits(i) = 1;
    else
        ask_demodulated_bits(i) = 0;
    end
end

% --- FSK Demodulation (Frequency Detection) ---
fsk_demodulated_bits = zeros(1, num_bits);
for i = 1:num_bits
    start_idx = (i-1) * bit_duration * fs + 1;
    end_idx = i * bit_duration * fs;
    if end_idx > length(t)
        end_idx = length(t);
    end
    segment = fsk_modulated(start_idx:end_idx);
    % Count zero crossings per bit period
    zero_crossings = sum(abs(diff(sign(segment))) > 0);
    % Threshold for frequency detection
    if zero_crossings > 20
        fsk_demodulated_bits(i) = 1; % Higher frequency = bit 1
    else
        fsk_demodulated_bits(i) = 0; % Lower frequency = bit 0
    end
end

% --- PSK Demodulation (Coherent Detection) ---
psk_demodulated_bits = zeros(1, num_bits);
carrier_psk = cos(2*pi*fc_psk*t);

for i = 1:num_bits
    start_idx = (i-1) * bit_duration * fs + 1;
    end_idx = i * bit_duration * fs;
    if end_idx > length(t)
        end_idx = length(t);
    end
    segment = psk_modulated(start_idx:end_idx);
    carrier_segment = carrier_psk(start_idx:end_idx);
    % Multiply with carrier and integrate
    product = segment .* carrier_segment;
    sum_product = sum(product);
    if sum_product > 0
        psk_demodulated_bits(i) = 1;
    else
        psk_demodulated_bits(i) = 0;
    end
end

% Display demodulation results
fprintf('Original Data:        ');
fprintf('%d ', data_bits);
fprintf('\n');
fprintf('ASK Demodulated:      ');
fprintf('%d ', ask_demodulated_bits);
fprintf('\n');
fprintf('FSK Demodulated:      ');
fprintf('%d ', fsk_demodulated_bits);
fprintf('\n');
fprintf('PSK Demodulated:      ');
fprintf('%d ', psk_demodulated_bits);
fprintf('\n');

% Calculate error rates
ask_errors = sum(data_bits ~= ask_demodulated_bits);
fsk_errors = sum(data_bits ~= fsk_demodulated_bits);
psk_errors = sum(data_bits ~= psk_demodulated_bits);

fprintf('\nBit Error Rates:\n');
fprintf('ASK BER: %.2f%%\n', (ask_errors/num_bits)*100);
fprintf('FSK BER: %.2f%%\n', (fsk_errors/num_bits)*100);
fprintf('PSK BER: %.2f%%\n', (psk_errors/num_bits)*100);
disp('');

% ============================================================
% SECTION 8: PERFORMANCE ANALYSIS
% ============================================================
disp('📊 8. PERFORMANCE ANALYSIS');
disp('───────────────────────────────────────────────────────────────');

% Bandwidth calculations
bw_ask = 2 * bit_rate;
bw_fsk = 2 * (fc_fsk2 - fc_fsk1) + 2 * bit_rate;
bw_psk = 2 * bit_rate;

fprintf('Bandwidth Requirements:\n');
fprintf('ASK Bandwidth: %.2f Hz\n', bw_ask);
fprintf('FSK Bandwidth: %.2f Hz\n', bw_fsk);
fprintf('PSK Bandwidth: %.2f Hz\n', bw_psk);
disp('');

fprintf('Comparison:\n');
fprintf('ASK: Simple, low cost, but susceptible to noise\n');
fprintf('FSK: Moderate complexity, better noise immunity\n');
fprintf('PSK: Complex, best noise immunity, used in high-speed systems\n');
disp('');

% ============================================================
% SECTION 9: DEMODULATED SIGNALS PLOT
% ============================================================
disp('📊 9. DEMODULATED SIGNALS PLOT');
disp('───────────────────────────────────────────────────────────────');

try
    figure('Position', [50, 50, 1000, 700]);
    
    % Plot 1: ASK Demodulated
    subplot(3,1,1);
    stairs(0:bit_duration:total_time, [data_bits, data_bits(end)], 'b-', 'LineWidth', 2);
    hold on;
    stairs(0:bit_duration:total_time, [ask_demodulated_bits, ask_demodulated_bits(end)], 'r--', 'LineWidth', 2);
    grid on;
    xlabel('Time (s)');
    ylabel('Amplitude');
    title('ASK Demodulation Comparison');
    legend('Original', 'ASK Demodulated', 'Location', 'best');
    axis([0 total_time -0.5 1.5]);
    hold off;
    
    % Plot 2: FSK Demodulated
    subplot(3,1,2);
    stairs(0:bit_duration:total_time, [data_bits, data_bits(end)], 'b-', 'LineWidth', 2);
    hold on;
    stairs(0:bit_duration:total_time, [fsk_demodulated_bits, fsk_demodulated_bits(end)], 'r--', 'LineWidth', 2);
    grid on;
    xlabel('Time (s)');
    ylabel('Amplitude');
    title('FSK Demodulation Comparison');
    legend('Original', 'FSK Demodulated', 'Location', 'best');
    axis([0 total_time -0.5 1.5]);
    hold off;
    
    % Plot 3: PSK Demodulated
    subplot(3,1,3);
    stairs(0:bit_duration:total_time, [data_bits, data_bits(end)], 'b-', 'LineWidth', 2);
    hold on;
    stairs(0:bit_duration:total_time, [psk_demodulated_bits, psk_demodulated_bits(end)], 'r--', 'LineWidth', 2);
    grid on;
    xlabel('Time (s)');
    ylabel('Amplitude');
    title('PSK Demodulation Comparison');
    legend('Original', 'PSK Demodulated', 'Location', 'best');
    axis([0 total_time -0.5 1.5]);
    hold off;
    
    drawnow;
    disp('✅ Demodulation plots generated successfully');
    
catch ME
    disp('⚠️ Demodulation plots failed:');
    disp(['   Error: ', ME.message]);
end
disp('');

% ============================================================
% SECTION 10: FILE OPERATIONS
% ============================================================
disp('📊 10. FILE OPERATIONS');
disp('───────────────────────────────────────────────────────────────');

% Save data to file
filename = 'modulation_data.txt';
fid = fopen(filename, 'w');
fprintf(fid, 'ASK, FSK & PSK Modulation Data\n');
fprintf(fid, '================================\n\n');
fprintf(fid, 'Data Bits: ');
for i = 1:num_bits
    fprintf(fid, '%d ', data_bits(i));
end
fprintf(fid, '\n\n');

fprintf(fid, 'ASK Demodulated: ');
for i = 1:num_bits
    fprintf(fid, '%d ', ask_demodulated_bits(i));
end
fprintf(fid, '\n');

fprintf(fid, 'FSK Demodulated: ');
for i = 1:num_bits
    fprintf(fid, '%d ', fsk_demodulated_bits(i));
end
fprintf(fid, '\n');

fprintf(fid, 'PSK Demodulated: ');
for i = 1:num_bits
    fprintf(fid, '%d ', psk_demodulated_bits(i));
end
fprintf(fid, '\n\n');

fprintf(fid, 'Bandwidth Requirements:\n');
fprintf(fid, 'ASK: %.2f Hz\n', bw_ask);
fprintf(fid, 'FSK: %.2f Hz\n', bw_fsk);
fprintf(fid, 'PSK: %.2f Hz\n', bw_psk);

fclose(fid);
fprintf('✅ Data saved to: %s\n', filename);
disp('');

% ============================================================
% SECTION 11: SUMMARY
% ============================================================
disp('📊 11. MODULATION TECHNIQUES SUMMARY');
disp('───────────────────────────────────────────────────────────────');

disp('ASK (Amplitude Shift Keying):');
disp('  - Carrier amplitude varies with data bits');
disp('  - Simple to implement');
disp('  - Susceptible to noise');
disp('  - Used in IR remote controls');
disp('');

disp('FSK (Frequency Shift Keying):');
disp('  - Carrier frequency varies with data bits');
disp('  - Good noise immunity');
disp('  - Used in Bluetooth, Modems');
disp('');

disp('PSK (Phase Shift Keying):');
disp('  - Carrier phase varies with data bits');
disp('  - Best noise immunity');
disp('  - Used in WiFi, Satellite communication');
disp('');

% ============================================================
% END
% ============================================================
disp('╔══════════════════════════════════════════════════════════════╗');
disp('║      MODULATION DEMO RUN SUCCESSFULLY                     ║');
disp('╚══════════════════════════════════════════════════════════════╝');

warning('on', 'all');

fprintf('\n📌 Press any key to close plots...\n');
pause;
close all;