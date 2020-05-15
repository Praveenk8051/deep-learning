clear variables

%% Load the data
a = load('denoise_20IN.mat');
b = load('denoise_20MF.mat');

X=(a.in);
T=(b.z);

%% Create Network
trainFcn = 'trainlm';  % Levenberg-Marquardt backpropagation.
hiddenLayerSize = [20 20 20];
net= feedforwardnet(hiddenLayerSize,trainFcn);

%% Data Division
net.divideFcn  = 'divideind';
net.divideMode = 'sample';
net.divideParam.trainInd= 1:100000;
net.divideParam.valInd  = 100001:125000;
net.divideParam.testInd = 125001:153600;

%% Hyperparams
net.trainParam.lr = 1.0000e-05;
net.trainParam.mu= 1.0000e-02;
net.trainParam.epochs = 20;

%% Batch Training
[net,tr] = train(net,X,T);



%% Test the Network
y = net(X);
e = gsubtract(T,y);
performance = perform(net,T,y);

        
        




%% Recalculate Training, Validation and Test Performance
trainTargets = T .* tr.trainMask{1};
valTargets = T .* tr.valMask{1};
testTargets = T .* tr.testMask{1};
trainPerformance = perform(net,trainTargets,y);
valPerformance = perform(net,valTargets,y);
testPerformance = perform(net,testTargets,y);

%% View the Network
view(net)
%% For a list of all plot functions type: help nnplot
net.plotFcns = {'plotperform','plottrainstate','ploterrhist', ...
    'plotregression', 'plotfit'};
%% Plots

%figure, plotperform(tr)
%figure, plottrainstate(tr)
%figure, ploterrhist(e)
%figure, plotregression(t,y)
%figure, plotfit(net,x,t)

