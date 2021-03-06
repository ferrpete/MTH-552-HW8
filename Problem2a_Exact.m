% Problem2a_Exact.m
% Peter Ferrero, Oregon State University, 3/13/2018, MTH 552, Homework 8
% A function to calculate the exact solution of Problem 2a.

function u = Problem2a_Exact(x,type)

if type == '1'
    
    u = 0.5*(x - x.^2);
    
else
    
    u = zeros(length(x),1);
    
    u(x < 0.5, 1) = 0.125*x(x < 0.5);
    u(x >= 0.5, 1) = -0.5*x(x >= 0.5).^2 + 0.625*x(x >= 0.5) - 0.125;
    
end

end