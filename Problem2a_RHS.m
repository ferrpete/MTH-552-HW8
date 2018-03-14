% Problem2a_RHS.m
% Peter Ferrero, Oregon State University, 3/13/2018, MTH 552, Homework 8
% A function to calculate the source function f for Problem 2a.

function f = Problem2a_RHS(x,type)

if type == '1'

    f = ones(length(x)-2,1);
    
else
    
    f = zeros(length(x)-2,1);
    f(x(2:end-1) >= 0.5, 1) = 1;
    
end

end