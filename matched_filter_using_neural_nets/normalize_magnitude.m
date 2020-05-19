function [x,t]=normalize_magnitude(x,f)
x=x/(max(abs(x)));       %normalize
O=length(x);
t=linspace(0,O/f,O);

