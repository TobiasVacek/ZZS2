function [H, H_dB] = fir_plot(b,fs,t_n)
%FIR_PLOT Summary of this function goes here
%   Detailed explanation goes here
H = fft(b,fs);
H_dB = 20*log10(abs(H));
f = linspace(0,fs-1,length(H));
figure
set(gcf,'Position', [0 0 800 400])
subplot(231)
plot(t_n,b)
xlabel('cas (s)')
ylabel('h')

subplot(232)
plot(f, abs(H))
xlabel('f (Hz)')
ylabel("|H(f)| [x100%]")
subplot(233)
plot(f, H_dB)
xlabel('f (Hz)')
ylabel("|H(f)| [dB]")
subplot(234)
zplane(b,1)
xlim([-2 2]) %graf občas obsahuje pár bodů o několik řádů vzdálených od většiny. Omezení je tu proto aby byla hlavní část vidět 
ylim([-2 2])
subplot(235)
plot(f,angle(H))
xlabel('f (Hz)')
ylabel('Phase(f) [rad]')
subplot(236)
plot(f,angle(H))
xlabel('f (Hz)')
ylabel('Phase(f) [rad]')
end

