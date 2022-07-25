% Read the audio signal and store it into matrix x3. Fs is the sample rate,
% which is necessary for write the audio signal into .wav file after proce-
% ssing.
[x3, Fs] = audioread("baila.wav"); 

% A matrix represent the index of each sample.
k = (1:length(x3));
sampleSize = length(x3);  % Size and No. of sample of x3

% Plot the audio signal x3
stem(k, x3);
title('Plot of audio signal x3[k]', 'Fontsize', 24);
xlabel('k', 'Fontsize', 24);
ylabel('x3[k]', 'Fontsize', 24);

e3 = sum(abs(x3.^2)); % Energy of the audio singal x3

% Generate matrix x3s[k] by keeping the first half of x3
x3Half = x3(1:sampleSize/2); 

% Write x3s[k] into an output audio file.
audiowrite("baila_half.wav", x3Half, Fs);
