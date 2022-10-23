//This program finds the frequency components in a given mixed frequency signal
//ixed frequency signal was recorded by playing 2 tuning forks simulatneously
clc;
close;
clear;

[y,Fs] = wavread('C:\Users\anees\Downloads\mixed sample 1k,10k.wav');  //read the audio file

Y=abs(fft(y));   //Find the fourirer transform

l = length(Y)/2;
f = (0:(l-1))*Fs/(2*l);  //modify the x-axis to represent frequency instead of samples

abs_fft = abs(Y(1:l));
plot(f,abs_fft);  //plot magnitude of fourier transform
title('Fourier Transform of signal')
xlabel('Frequency')
ylabel('Amplitude')

peak = max(abs_fft);  //find the first maxima of the spectrum
secpeak =max(abs_fft(abs_fft<max(abs_fft)));  //find the second maxima of the spectrum
peakfreq=[f(abs_fft == peak),f(abs_fft == secpeak)];  //Find the frequency corresponding to the peaks
peakfreq = gsort(peakfreq);  //sort the detected frequencies
peakfreq(abs(max(peakfreq) - max(peakfreq(peakfreq<max(peakfreq)))) < 10) =[]; //remove frequencies that are very close to one another

disp('Given signal has following frequencies (in Hz):.');
disp(peakfreq);  //display the contained frequencies
