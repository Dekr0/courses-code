fcs = [2800 3300]; % Cut-off frequency of the filter
Fs = 22050; % Sampling frequency of the audio signal
N = 513;
wcs = fcs / (Fs / 2);

window = hamming(N); % Truncation window function

filter_coeff = fir1(N - 1, wcs, 'stop', window); % Coefficients of the FIR filter

freqz(filter_coeff, 1); % Plot the frequency response of the filter
title("Frequency response of the band-stop FIR filter (cutoff frequency from 2.8 kHz to 3.3 kHz)");

[x, xFs] = audioread("love_mono22.wav");

x_filtered = filter(filter_coeff, 1, x); % Filter the input signals

% Power Spectral Density of the input signal and output signal
[Px, F] = pwelch(x, window, [], 4098, xFs);
[Px_filtered, F_filtered] = pwelch(x_filtered, window, [], 4098, Fs);

f2 = figure;
plot(F/1000, 10*log10(Px));
hold on;
plot(F_filtered/1000, 10*log10(Px_filtered));
title("Spectrum of the input and output signals");
xlabel("Frequency (kHz)");
ylabel("Power Spectral Density (in dB)");
legend("Input signal", "Output signal");
axis([0 11.05 -110 -30]);

audiowrite("love_mono22_BS.wav", x_filtered, Fs);