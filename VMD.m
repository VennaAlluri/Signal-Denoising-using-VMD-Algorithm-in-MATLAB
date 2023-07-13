clc;clear all;close all

[x1,fs] = audioread('1_Normal Heart.wav'); % Reading our audio file
dt = 1/fs;
x = awgn(x1,15,'measured'); % noisy heart sound
[imf,res] = vmd(x,'NumIMFs',4,'PenaltyFactor',2000); % Doing VMD Decomposition
t=linspace(0,1,length(x));
snr_in = get_snr(x1,x) % Calculating snr_in.
snr_out = get_snr(x1,imf(:,4))% Calculating snr_out.
figure(1)
plot(t,x1) % Plotting our original signal.
figure(2) 
for i = 1:4 % For plotting our imf's
    nexttile
    plot(t,imf(:,i))
    txt = ['IMF',num2str(i)];
    ylabel(txt)
    xlabel('Time (s)')
    grid on
end
figure(3)
plot(t,imf(:,4)) % Plotting our accurate imf.