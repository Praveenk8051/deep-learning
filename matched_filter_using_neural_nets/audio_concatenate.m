%% Function to concatenate all the .wav files read from the folder
function z=audio_concatenate(signal)

y_prev=0;

for i=1:length(signal)  %% Loop across all the files
    y_new=signal{i};
    z1=cat(1,y_prev,y_new);
    y_prev=z1;
end

z=z1;
end