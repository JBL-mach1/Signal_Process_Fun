% Filter Design, James Lesser, 9/23/2022
clear; clc; close all;

% Load filter coefficients
load TF_Filter_Data_10kHz.mat HfFilterNew

% Sampling Frequency
Fs = 10000;  

% Frequency vector
freq = linspace(0,Fs/2,4097);

% Order
N = 256;   

% Weight vector
W = ones(2^11,1);

% Increase the weight in the stopband (round(2400*(2^11/5000)):end)
W(round(2400*(2^11/5000)):end) = 100.*W(round(2400*(2^11/5000)):end);

% Frequency bands
F = freq(1:end-1);

% Band amplitudes
A = HfFilterNew(1:end-1);

% Calculate filter coefficients using the FIRLS function.
b  = firls(N,F/(Fs/2),A,W);
Hd = dfilt.dffir(b);
freqz(Hd)

% Save filter coefficients
save('TF_Filter_Coeff_10kHz.mat','b')





