% Problem2a
% Peter Ferrero, Oregon State University, 3/13/2018, MTH 552, Homework 8
% A program to solve a second-order boundary value problem and show
% convergence

clearvars

n = [9,17,33,65,129,257,513,1025,2049,4097,8193];
% n = [11,101,1001,10001,100001];
N = length(n);
MaxError = zeros(N,1);
L2Error = zeros(N,1);

for i=1:N
    
    type = '1';
    x = linspace(0,1,n(i));
    h(i,1) = x(2)-x(1);
    dX2 = h(i)^2;
    n_interior = length(x) - 2;
    
    row_ndx = [2:n_interior, 1:n_interior, 1:n_interior-1]';
    col_ndx = [1:n_interior-1, 1:n_interior, 2:n_interior]';
    values = zeros(n_interior+2*(n_interior-1),1);
    values(1:n_interior-1) = -1;
    values(n_interior:2*n_interior-1) = 2;
    values(2*n_interior:3*n_interior-2) = -1;
    
    A = sparse(row_ndx,col_ndx,values);
    condA(i,1) = condest(A);
    
    f = dX2.*Problem2a_RHS(x',type);
    
    u = zeros(length(x),1);
    u(2:end-1) = A\f;
    
    u_true = Problem2a_Exact(x',type);
    
%     figure
%     plot(x,u,'ro',x,u_true,'k-')
%     text = ['Solution to BVP with h=' num2str(h(i))];
%     title(text)
%     xlabel('t')
%     ylabel('u(t)')
%     legend('Approximate', 'Exact')
    
    MaxError(i) = norm(u_true-u, Inf);
    L2Error(i) = sqrt(Simpson13Approx(n(i),x,(u_true-u).^2));
    
end

p1 = polyfit(log10(condA),log10(MaxError),1)
pval1 = polyval(p1,log10(condA));

p2 = polyfit(log10(h),log10(MaxError),1)
pval2 = polyval(p2,log10(h));

p3 = polyfit(log10(h),log10(condA),1)
pval3 = polyval(p3,log10(h));

figure(1)
plot(log10(h),log10(MaxError),'r-*',log10(h),log10(L2Error),'bx-',log10(h),pval2,'k-')
xlabel('log(h)')
ylabel('log(Error)')
legend('Max Error', 'L2 Error','Linear Fit')
figure(2)
plot(log10(condA),log10(MaxError),'r-*',log10(condA),log10(L2Error),'bx-',log10(condA),pval1,'k-')
xlabel('log(cond(A))')
ylabel('log(Error)')
legend('Max Error', 'L2 Error','Linear Fit')
legend('Location', 'southeast')
figure(3)
plot(log10(h),log10(condA),'r-*',log10(h),pval3,'k-')
xlabel('log(h)')
ylabel('log(cond(A))')
legend('Actual','Linear Fit')

clearvars

n = [11,101,1001,10001];
N = length(n);
MaxError = zeros(N,1);
L2Error = zeros(N,1);

for i=1:N
    
    type = '2';
    x = linspace(0,1,n(i));
    h(i,1) = x(2)-x(1);
    dX2 = h(i)^2;
    n_interior = length(x) - 2;
    
    row_ndx = [2:n_interior, 1:n_interior, 1:n_interior-1]';
    col_ndx = [1:n_interior-1, 1:n_interior, 2:n_interior]';
    values = zeros(n_interior+2*(n_interior-1),1);
    values(1:n_interior-1) = -1;
    values(n_interior:2*n_interior-1) = 2;
    values(2*n_interior:3*n_interior-2) = -1;
    
    A = sparse(row_ndx,col_ndx,values);
    
    f = dX2.*Problem2a_RHS(x',type);
    
    u = zeros(length(x),1);
    u(2:end-1) = A\f;
    
    u_true = Problem2a_Exact(x',type);
    
%     figure
%     plot(x,u,'ro',x,u_true,'k-')
%     text = ['Solution to BVP with h=' num2str(h(i))];
%     title(text)
%     xlabel('t')
%     ylabel('u(t)')
%     legend('Approximate', 'Exact')
    
    MaxError(i) = norm(u_true-u, Inf);
    L2Error(i) = sqrt(Simpson13Approx(n(i),x,(u_true-u).^2));
    
end

figure(4)
loglog(h,MaxError,'r-*',h,L2Error,'bx-',h,h,'k-')
xlabel('Stepsize, h')
ylabel('Error, e(h)')
legend('Max Error', 'L2 Error','Linear')
legend('Location', 'southeast')

clearvars

n = [12, 112, 1112, 11112];
N = length(n);
MaxError = zeros(N,1);
L2Error = zeros(N,1);

for i=1:N
    
    type = '2';
    x = linspace(0,1,n(i));
    h(i,1) = x(2)-x(1);
    dX2 = h(i)^2;
    n_interior = length(x) - 2;
    
    row_ndx = [2:n_interior, 1:n_interior, 1:n_interior-1]';
    col_ndx = [1:n_interior-1, 1:n_interior, 2:n_interior]';
    values = zeros(n_interior+2*(n_interior-1),1);
    values(1:n_interior-1) = -1;
    values(n_interior:2*n_interior-1) = 2;
    values(2*n_interior:3*n_interior-2) = -1;
    
    A = sparse(row_ndx,col_ndx,values);
    
    f = dX2.*Problem2a_RHS(x',type);
    
    u = zeros(length(x),1);
    u(2:end-1) = A\f;
    
    u_true = Problem2a_Exact(x',type);
    
%     figure
%     plot(x,u,'ro',x,u_true,'k-')
%     text = ['Solution to BVP with h=' num2str(h(i))];
%     title(text)
%     xlabel('t')
%     ylabel('u(t)')
%     legend('Approximate', 'Exact')
    
    MaxError(i) = norm(u_true-u, Inf);
    L2Error(i) = sqrt(Simpson13Approx(n(i),x,(u_true-u).^2));
    
end

figure(5)
loglog(h,MaxError,'r-*',h,L2Error,'bx-',h,h.^2,'k-')
xlabel('Stepsize, h')
ylabel('Error, e(h)')
legend('Max Error', 'L2 Error','Quadratic')
legend('Location', 'southeast')
axis([h(end),h(1),-inf,inf])