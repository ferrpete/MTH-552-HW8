% Problem2b_Exact.m
% Peter Ferrero, Oregon State University, 3/13/2018, MTH 552, Homework 8
% A function to calculate the exact solution of Problem 2b.

function u = Problem2b_Exact(x,epsilon)

alpha = (1/epsilon) + (x./epsilon) + log(exp(-x./epsilon)*exp(-1/epsilon) + exp(-x./epsilon) - exp(-(2*x)./epsilon) - exp(-1/epsilon));
beta = (1/epsilon) + log(exp(-1/epsilon) + 1);
logu = alpha - beta;

u = exp(logu);
u(1) = 0;
u(end) = 0;

end