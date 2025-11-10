function [S,F,Tn,Sdb] = my_spectrogram(y,ww,nn,zz,fs)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
N = ww+zz;
idx=1:ww-nn:length(y)-ww+1; % ww=velikost okna, nn= negativní překryv (ve vzorcích)

 S = zeros(N,length(idx));       % S=zeros(... , ...) rezervace matice S v paměti o rozměru f_k X T_n
 win = hamming(ww);       % win=... váhovací okno délky ww 

for i=1:length(idx)

yseg = y(idx(i):(idx(i)+ww -1));            % yseg= výběr segmentu ze signálu y()
ywin = yseg.*win';            % váhování segmentu oknem (pozor na orientaci vektorů a vstupem funkce pro vytvoření okna je jedno číslo - zvažte, jestli je nutno použít funkci lenght)
yzeros = [ywin zeros(1,zz)];            % doplnění segmentu nulami

PSD = 1/length(yzeros).*abs(fft(yzeros)).^2;            % výpočet výkonového spektra (PSD) (pozor na normalizaci délkou signálu bez umocnění)

S(:,i) = PSD;            % S(:,i)=...  uložení PSD do matice S
end
Sdb = 10*log10(S);
F = linspace(0,fs -fs/N,N);
Tn=(idx+ww/2)/fs; % časová osa spektrogramu
end