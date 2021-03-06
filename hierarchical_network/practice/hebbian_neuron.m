% Hebbian neuron.
% This is Pavlov's drooling bell dog.
%
% We have two presynaptic neurons, the bell and the food. 
% We then have one output neuron. Really what we have is 2 
% inputs and one output, so in effect the same as having one
% neuron.

% number of inputs 
ni = 2;
% number of iterations 
it = 100;
% weights; w1 is the food, w2 is the bell. 
% We initialise the neuron so that the dog drools in response to the food.
W = [1, 0];
% learning rate 
r = 0.01;
% inputs; we present both the bell and the food
inputs = ones(it, 2);
% Prevent weights from getting arb. big
max = 1;

% For plotting purposes, keep a history of weights
pastWeights = zeros(it, 2);

for i=1:it
    % Store history of weights.
    pastWeights(i, :) = W;
    % Get the output by summing weighted inputs. 
    output = sum(W.*inputs(i, :));
    % Get the weight change.
    dW = r*inputs(i,:)*output;
    % update weights.
    W = W + dW;
    % Keep the weights <= max
    ind = find(W > 1);
    W(ind) = 1;
end 