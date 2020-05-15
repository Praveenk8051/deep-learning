%% This function takes the input from user, reads all the files in Folder and concatenates in N*1 format

function [send_signal,fs]=get_signal()
%% Cell array to store values of all signals
signal={};

%% Prompt from the User to enter folder name 
k= input('Enter the folder name where audio file is present!, Try Uploading max of 5secs of One .wav Audio\n','s');
myFiles = dir(k); 

%% Loop over all the files in the folder
for i=3:length(myFiles)
    
baseFileName = myFiles(i).name;
fullFileName = fullfile(k, baseFileName);
fprintf(1, 'Now reading %s\n', fullFileName);
  
%% Read the .wav format of signal , upto 5secs
[sig, fs] = audioread(fullFileName);
sig=sig(fs*1:fs*5);    %Extract 5secs of signal
[y,t]=normalize_magnitude(sig,fs);


%% Denoise
y=denoise(y);
fprintf("Size of the signal %d %d \n",size(y));

%% Plotting
figure
plot(t,y);
axis([0 4 -1 1])
xlabel('Time in secs');
ylabel('Amplitude');
title('Time Domain Cachalot Signal');

signal{i-2}=y;

end
%% Concatenate to N*1 format
send_signal=audio_concatenate(signal);
end
