%% This function generates the macthed filter output provided the reference signal(handlabeled data)from the audio
% input signal
function matchedfil_sig=matchFilter_signal()


%% Get the audio signal
[y,fs]=get_signal;

%% Load the location where reference signal is present in audio signal 
A = xlsread('values_new_Delphinidae.xlsx');
%% Cut the signal
ref=y(fs*A(1,1):fs*A(1,2));

%% Normalize the magnitude
[ref,t1]=normalize_magnitude(ref,fs);

%% Plotting
% figure
% plot(t1,ref);
% title('Not-Flipped, Hand-labelled Signal')

%% Time reverese it for Convolution
ref=flipud(ref);

%% Plotting
% [ref,t1]=Normalize(ref,fs);
% figure
% plot(t1,ref);
% title('Flipped,Hand-labelled Signal')

%% Perform Convolution
MF=conv2(y,ref);       

%% Normalize it
[MF,t2]=normalize_magnitude(MF,fs);

%% Plotting
figure
plot(t2,MF);
axis([0 5 -1 1])
xlabel('Time in secs')
ylabel('Amplitude')
title('Matched Filter Output')

matchedfil_sig=MF;
end