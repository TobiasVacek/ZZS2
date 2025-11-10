function [avg,sd,med,wavr]=kos_prumer(c, w) % počet vstupů a výstupů může být libovolný
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
avg = mean(c)
sd = std(c,w)
med = median(c)
wavr = (w*c')/sum(w)
end