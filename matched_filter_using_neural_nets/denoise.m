
function signal=denoise(sig)
n1 = 512;  				%n1 and n2 are the steps for analysis and synthesis
n2 = n1;
WLen = 2048;			%Window Length

w1 = hann(WLen);
w2 = w1;


%---- initializations

L=  length(sig);
sig = [zeros(WLen, 1) ; sig; ...
zeros(WLen-mod(L,n1) ,1)] / max(abs(sig));


WLen2 = WLen/2;
coef = 0.01;
% freq = (0:1:299)/WLen*fs;
sig_out = zeros(length(sig),1);



pin = 0;
pout = 0;
pend = length(sig) - WLen;

while pin<pend
grain = sig(pin+1 : pin+WLen) .* w1 ; 

f = fft (grain);
r = abs (f)/WLen2 ;
ft = f .*r./(r+coef);
grain = (real(ifft(ft))) .*w2;

sig_out(pout+1:pout+WLen) = ...
	sig_out(pout+1:pout+WLen)+grain;
pin = pin + n1;
pout = pout + n2;
end


%----- listening and saving the output--



sig_out= sig_out(WLen+1:WLen+L) ;

%Plotting 
% figure
% plot(t,sig_out);
% xlabel('Time in secs');
% ylabel('Amplitude');
% title('Denoised Time Domain Cachalot Signal');
signal=sig_out;
end