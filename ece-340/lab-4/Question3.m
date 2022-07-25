[x, Fs] = audioread("love_mono22.wav");

N = 512; 
[Px, F]=pwelch(x, N, [], N, Fs); 

plot(F/1000, 10*log10(Px)); % Plots the power spectrum 
xlabel('Frequency (kHz) '); % scaling F by 1000 will represent frequency in kHz 
ylabel('Power Spectral Density (in dB) ');
