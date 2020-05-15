clear variables

%% Load NN
c=load('13Epoch.mat');


%% Input Signal
[input,fs]=get_signal;

%% Frame format for NN
input=framing(input);

%% Pass to NN
y=c.net(input);

%% Plot format
y=plot_form(y);

%% Normalize to magnitude
[y,t]=normalize_magnitude(y,fs);
%% Plotting
figure
plot(t,y)
xlabel('Time in secs')
ylabel('Amplitude')
title('Neural Network Output')

%% Call corresponding MF to match/compare
mf=matchFilter_signal;



