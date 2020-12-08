%% Machine Learning Online Class
%  Exercise 1: Linear regression with multiple variables
%
%  Instructions
%  ------------
% 
%  This file contains code that helps you get started on the
%  linear regression exercise. 
%
%  You will need to complete the following functions in this 
%  exericse:
%
%     warmUpExercise.m
%     plotData.m
%     gradientDescent.m
%     computeCost.m
%     gradientDescentMulti.m
%     computeCostMulti.m
%     featureNormalize.m
%     normalEqn.m
%
%  For this part of the exercise, you will need to change some
%  parts of the code below for various experiments (e.g., changing
%  learning rates).
%

%% Initialization

%% ================ Part 1: Feature Normalization ================

%% Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');

%% Load Data
data = load('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

% Print out some data points
fprintf('First 10 examples from the dataset: \n');
fprintf(' x = [%.0f %.0f], y = %.0f \n', [X(1:10,:) y(1:10,:)]');

fprintf('Program paused. Press enter to continue.\n');
pause;

% Scale features and set them to zero mean
fprintf('Normalizing Features ...\n');

[X mu sigma] = featureNormalize(X);

% Add intercept term to X
X = [ones(m, 1) X];


%% ================ Part 2: Gradient Descent ================

% ====================== YOUR CODE HERE ======================
% Instructions: We have provided you with the following starter
%               code that runs gradient descent with a particular
%               learning rate (alpha). 
%
%               Your task is to first make sure that your functions - 
%               computeCost and gradientDescent already work with 
%               this starter code and support multiple variables.
%
%               After that, try running gradient descent with 
%               different values of alpha and see which one gives
%               you the best result.
%
%               Finally, you should complete the code at the end
%               to predict the price of a 1650 sq-ft, 3 br house.
%
% Hint: By using the 'hold on' command, you can plot multiple
%       graphs on the same figure.
%
% Hint: At prediction, make sure you do the same feature normalization.
%

fprintf('Running gradient descent ...\n');

% Choose some alpha value
alpha = [1; 0.3; 0.1; 0.03; 0.01; 0.003; 0.001];
num_iters = [400; 400; 400; 400; 400; 400; 400];
theta = zeros(3,7);
                                                                                               
% Init Theta and Run Gradient Descent 
[theta(:,1), J_history1] = gradientDescentMulti(X, y, theta(:,1), alpha(1), num_iters(1));
[theta(:,2), J_history2] = gradientDescentMulti(X, y, theta(:,2), alpha(2), num_iters(2));
[theta(:,3), J_history3] = gradientDescentMulti(X, y, theta(:,3), alpha(3), num_iters(3));
[theta(:,4), J_history4] = gradientDescentMulti(X, y, theta(:,4), alpha(4), num_iters(4));
[theta(:,5), J_history5] = gradientDescentMulti(X, y, theta(:,5), alpha(5), num_iters(5));
[theta(:,6), J_history6] = gradientDescentMulti(X, y, theta(:,6), alpha(6), num_iters(6));
[theta(:,7), J_history7] = gradientDescentMulti(X, y, theta(:,7), alpha(7), num_iters(7));

% Plot the convergence graph
figure;
xlabel('Number of iterations');
ylabel('Cost J');
hold on;
plot(1:numel(J_history1), J_history1, '-b');
plot(1:numel(J_history2), J_history2, '-r');
plot(1:numel(J_history3), J_history3, '-g');
plot(1:numel(J_history4), J_history4, '-y');
plot(1:numel(J_history5), J_history5, '-k');
plot(1:numel(J_history6), J_history6, '-p');
plot(1:numel(J_history7), J_history7, '-o');
legend('1 Alpha', '0.3 Alpha','0.1 Alpha','0.03 Alpha','0.01 Alpha','0.003 Alpha','0.001 Alpha');

% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');

% Estimate the price of a 1650 sq-ft, 3 br house
% ====================== YOUR CODE HERE ======================
% Recall that the first column of X is all-ones. Thus, it does
% not need to be normalized.
house = [1650 3];
house = [1 (house - mu)./sigma];
price = []; % You should change this
price(1) = house * theta(:,1);
price(2) = house * theta(:,2);
price(3) = house * theta(:,3);
price(4) = house * theta(:,4);
price(5) = house * theta(:,5);
price(6) = house * theta(:,6);
price(7) = house * theta(:,7);


% ============================================================

fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using gradient descent):\n $%f\n'], price);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ================ Part 3: Normal Equations ================

fprintf('Solving with normal equations...\n');

% ====================== YOUR CODE HERE ======================
% Instructions: The following code computes the closed form 
%               solution for linear regression using the normal
%               equations. You should complete the code in 
%               normalEqn.m
%
%               After doing so, you should complete this code 
%               to predict the price of a 1650 sq-ft, 3 br house.
%

%% Load Data
data = csvread('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

% Add intercept term to X
X = [ones(m, 1) X];

% Calculate the parameters from the normal equation
theta = normalEqn(X, y);

% Display normal equation's result
fprintf('Theta computed from the normal equations: \n');
fprintf(' %f \n', theta);
fprintf('\n');


% Estimate the price of a 1650 sq-ft, 3 br house
% ====================== YOUR CODE HERE ======================
price = 0; % You should change this


% ============================================================

fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using normal equations):\n $%f\n'], price);

