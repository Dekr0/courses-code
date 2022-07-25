function y=sysresp(x, a)
% computes the output in response to an arbitrary input x[n], n=0,¡­N-1
% assume that the system has 0 initial conditions
% input:
% x: the input signal,
% a: the system parameter
% output:
% y: the output signal

% Return the length input signal / input matrix x
n = length(x);

y = zeros(n, 1); % Initialize the output signal / output matrix y
y(1) = x(1); % The first sample is always 1 due to given initial condition

% Generate each sample from k = 1 to n - 1
for i = 2:n
   y(i) = x(i) + a * y(i-1);
end

return


