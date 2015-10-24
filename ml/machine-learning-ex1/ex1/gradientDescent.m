function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
  % Initialize some useful values
  m = length(y); % number of training examples
  J_history = zeros(num_iters, 1);
  for iter = 1 : num_iters
    sn = zeros(size(X, 2), 1);
    for i = 1 : m
      s = 0;
      for j = 1 : size(X, 2)
        s += theta(j) * X(i, j);
      end
      s -= y(i);
      for j = 1 : size(X, 2)
        sn(j) += s * X(i, j);
      end
    endfor;
    for j = 1 : size(theta, 1)
      theta(j) -= (alpha / m) * sn(j);
    end
    J_history(iter) = computeCost(X, y, theta);
  end
end
