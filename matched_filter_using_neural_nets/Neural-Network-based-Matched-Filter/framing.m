%% This function enables the framing for the NN. This framing is purely decided by programmer,
% as per number of data complexity and processing ability for system

function z=framing(y)

%% Framing
N=length(y);
frame_len=20;
number_of_frames=floor(N/frame_len);


for k=1:number_of_frames  
  frames(:,k)=y( (k-1)*frame_len+1 : frame_len*k);
end
z=frames;
end
