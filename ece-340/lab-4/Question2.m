[x, Fs] = audioread("love_mono22.wav");

X = fft(x); % DFT of the audio signal

N = length(x);
scaledX = X / sqrt(N); % scaled X[r], X'[r]

magScaledX = abs(scaledX); % Absolute value of X'[r]

fm = Fs / N / 1000 * (0:N/2);
dbScaledX = 20 * log10(magScaledX(1:N / 2 + 1));

plot(fm, dbScaledX);
title("Magnitude Spectrum Plot of x[k]");
xlabel("Frequency (KHz)");
ylabel("Magnitude of X'[r] (dB)");


