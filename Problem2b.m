% Problem2b
% Peter Ferrero, Oregon State University, 3/13/2018, MTH 552, Homework 8
% A program to solve a second-order singularly perturbed
% boundary value problem for the stepsize that satisfies specified error
% criteria

function [L2Error, h] = Problem2b(epsilon, n)

type = '1';

x = linspace(0,1,n);
h = x(2)-x(1);
dX2 = h^2;
n_interior = length(x) - 2;

row_ndx = [2:n_interior, 1:n_interior, 1:n_interior-1]';
col_ndx = [1:n_interior-1, 1:n_interior, 2:n_interior]';
values = zeros(n_interior+2*(n_interior-1),1);
values(1:n_interior-1) = -epsilon^2;
values(n_interior:2*n_interior-1) = 2*(epsilon^2) + dX2*1;
values(2*n_interior:3*n_interior-2) = -epsilon^2;

A = sparse(row_ndx,col_ndx,values);

f = dX2.*Problem2a_RHS(x',type);

u = zeros(length(x),1);
u(2:end-1) = A\f;

u_true = Problem2b_Exact(x',epsilon);

L2Error = sqrt(Simpson13Approx(n,x,(u_true-u).^2));

plot(x,u,'ro',x,u_true,'k-')

end