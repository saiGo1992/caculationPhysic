Fs = 1000;                    % Sampling frequency
T = 1/Fs;                     % Sample time
N = 1000;                     % Length of signal
t = (0:N-1)*T;                % Time vector
% Sum of a 50 Hz sinusoid and a 120 Hz sinusoid
x = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t); 
y = x + 2*randn(size(t));     % Sinusoids plus noise
% x = sin(50*t)+sin(120*t);
% x = sin(2*pi*50*t);
subplot(1,2,1);
plot(Fs*t(1:50),x(1:50));
title('Signal Corrupted with Zero-Mean Random Noise')
xlabel('time (milliseconds)')
NFFT = 2^nextpow2(N); % Next power of 2 from length of y
y = fft(x,NFFT)/N;
f = Fs/2*linspace(0,1,NFFT/2);
subplot(1,2,2);
% Plot single-sided amplitude spectrum.
plot(f,2*abs(y(1:NFFT/2))) 
title('Single-Sided Amplitude Spectrum of y(t)')
xlabel('Frequency (Hz)')
ylabel('|y(f)|')