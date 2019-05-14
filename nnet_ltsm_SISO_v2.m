%% Load data
clear all
clc

% Add path (at beginning of script)
narx = [pwd,'\narx'];
nn_function1 = [pwd,'\nn_function1'];
nn_function2 = [pwd,'\nn_function1'];
addpath(narx);
addpath(nn_function1);
addpath(nn_function2);

%this script is predicting the rupture period
log_start = 0.5e5-2;

% Load Original Migatronic log files
log1 = importdata('data\modified\data1.csv');
log1= log1.data;
cv_1 = log1(log_start:end,1:2);
cvs_1 = log1(log_start:end,1:3);
short_1 = log1(log_start:end,3);
%rupture10_1 = log1(log_start:end,5);
%rupture5_1 = log1(log_start:end,6);
%rupture_spike_1 = log1(log_start:end,7);

log_end = length(3);

d = 10;
n = 10;
x1 = cv_1(d+1:d+1, 1:2)';
%x2 = test_target(1:log_end)';
xi1 = cv_1(1:d, 1:2)';


[y_new,xf1] = nn_d10n10(x1, xi1);


% Reshape data to be a row vectors features x timesteps
%data = cvs_1';
%data_target = short_1';

%clearvars -except train_input train_target test_input test_target cvs_1
%clearvars -except data data_target

%% Partition the training and test data. Train on the first 90% of the sequence and test on the last 10%.

numTimeStepsTrain = floor(0.9*numel(data(1,:)));
dataTrain = data(:, 1:numTimeStepsTrain+1);
dataTest = data(:, numTimeStepsTrain+1:end);


%% Standardize Data

% For a better fit and to prevent the training from diverging, 
% standardize the training data to have zero mean and unit variance. 
% At prediction time, you must standardize the test data using the same parameters as the training data.

mu = mean(dataTrain');
sig = std(dataTrain');

%dataTrainStandardized = (dataTrain - mu) / sig;

% TODO: Do not standardize the shrt as it already ranges 0-1?
dataTrainStandardized = [];
for i = 1:numel(mu)
    dataTrainStandardized = [dataTrainStandardized; dataTrain(i, :) - mu(i)/ sig(i)];
end

%% Prepare Predictors and Responses

% To forecast the values of future time steps of a sequence, specify the responses 
% to be the training sequences with values shifted by one time step. 
% That is, at each time step of the input sequence, the LSTM network learns to predict the value of the next time step. 
% The predictors are the training sequences without the final time step.

%XTrain = dataTrainStandardized(1:end-1, :)';
%YTrain = dataTrainStandardized(2:end, :)';
XTrain = dataTrainStandardized(:, 1:end-1);
%YTrain = dataTrainStandardized(3, :)';
YTrain = dataTrainStandardized(3, 2:end);

%% Define LSTM Network Architecture

%Create an LSTM regression network. Specify the LSTM layer to have 200 hidden units.

numFeatures = 3;
numResponses = 1;
numHiddenUnits = 10;

layers = [ ...
    sequenceInputLayer(numFeatures)
    lstmLayer(numHiddenUnits)
    fullyConnectedLayer(numResponses)
    regressionLayer];

%Specify the training options. Set the solver to 'adam' and train for 250 epochs.
% To prevent the gradients from exploding, set the gradient threshold to 1.
% Specify the initial learn rate 0.005, and drop the learn rate after 125 epochs by multiplying by a factor of 0.2.

epochs = 2;

options = trainingOptions('adam', ...
    'MaxEpochs',epochs, ...
    'GradientThreshold',1, ...
    'InitialLearnRate',0.005, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropPeriod',epochs/2, ...
    'LearnRateDropFactor',0.2, ...
    'Verbose',0, ...
    'Plots','training-progress');


%% Train LSTM Network

% Train the LSTM network with the specified training options by using trainNetwork.

net = trainNetwork(XTrain,YTrain,layers,options);

%% Forecast Future Time Steps

% To forecast the values of multiple time steps in the future, use the predictAndUpdateState 
% function to predict time steps one at a time and update the network state at each prediction. 
% For each prediction, use the previous prediction as input to the function.

%Standardize the test data using the same parameters as the training data.


% TODO: Do not standardize the shrt as it already ranges 0-1?
dataTestStandardized = [];
for i = 1:numel(mu)
    dataTestStandardized = [dataTestStandardized; dataTest(i, :) - mu(i)/ sig(i)];
end

XTest = dataTestStandardized(:, 1:end-1);


% To initialize the network state, first predict on the training data XTrain. 
% Next, make the first prediction using the last time step of the training response YTrain(end).
% Loop over the remaining predictions and input the previous prediction to predictAndUpdateState.

%For large collections of data, long sequences, or large networks, predictions on the GPU
% are usually faster to compute than predictions on the CPU. 
% Otherwise, predictions on the CPU are usually faster to compute. 
% For single time step predictions, use the CPU. To use the CPU for prediction, 
% set the 'ExecutionEnvironment' option of predictAndUpdateState to 'cpu'

net = predictAndUpdateState(net,XTrain);
[net,YPred] = predictAndUpdateState(net,YTrain(end));

numTimeStepsTest = numel(XTest);
for i = 2:numTimeStepsTest
    [net,YPred(:,i)] = predictAndUpdateState(net,YPred(:,i-1),'ExecutionEnvironment','cpu');
end

% Unstandardize the predictions using the parameters calculated earlier.
YPred = sig*YPred + mu;

%The training progress plot reports the root-mean-square error (RMSE) calculated from the standardized data.
% Calculate the RMSE from the unstandardized predictions.
YTest = dataTest(2:end);
rmse = sqrt(mean((YPred-YTest).^2))

%Plot the training time series with the forecasted values.
figure
plot(dataTrain(1:end-1))
hold on
idx = numTimeStepsTrain:(numTimeStepsTrain+numTimeStepsTest);
plot(idx,[data(numTimeStepsTrain) YPred],'.-')
hold off
xlabel("Samples")
ylabel("Voltage")
title("Forecast")
legend(["Observed" "Forecast"])

% Compare the forecasted values with the test data.
figure
subplot(2,1,1)
plot(YTest)
hold on
plot(YPred,'.-')
hold off
legend(["Observed" "Forecast"])
ylabel("Cases")
title("Forecast")

subplot(2,1,2)
stem(YPred - YTest)
xlabel("Month")
ylabel("Error")
title("RMSE = " + rmse)

function y = mapminmax_apply(x,settings)
y = bsxfun(@minus,x,settings.xoffset);
y = bsxfun(@times,y,settings.gain);
y = bsxfun(@plus,y,settings.ymin);
end