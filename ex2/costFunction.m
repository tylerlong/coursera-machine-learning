function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%


h = sigmoid(X * theta);
% 下面是我搞了很久搞错了，也值得参考借鉴。
% 不要轻易前后调换位置。如果最终期待的结果是一个 scalar，那么看看如何才能直接到达，不需要借助`sum()`
% 要搞清楚要transpose哪一个，否则本来可以得到scalar，得到的却是matrix
% J = sum(sum(y * -log(h)' - (1 - y) * log(1 - h)')) / m;
J = (-y' * log(h) - (1 - y)' * log(1 - h)) / m;
grad = (h - y)' * X / m;



% =============================================================

end
