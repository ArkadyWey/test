%Script to...

%-set up the derivative matrix
%applies to all questions
n=10;
h=1/n;

e=ones(1,n)';
A=spdiags([1*e -2*e 1*e], -1:1, n, n);
D2=(1/h^2)*A;
D2=full(D2);

D2(1,1)=1; %lhs of lower dirichlet BC
D2(1,2)=0;
D2(n,n)=1; %lhs of upper dirichlet BC
D2(n,n-1)=0;
%D2(n,1)=1;
%D2(1,n)=1;
D2;



%Q1

%-set up vector of x points
x_vals_1=linspace(0,1,n)';

%-set up the function on rhs
f_1=@(x) 10*sin(20*x)+cos(x.*5);

%-set up matrix on rhs
f_vals_1=f_1(x_vals_1);
f_vals_1(1,1)=0; %rhs of lower dirichlet BC
f_vals_1(n,1)=0.1; %rhs of upper dirichlet BC

%-solving difl eqn; to find u
u_vals_1=D2\f_vals_1;
u_vals_1;

%-plotting solution
plot(x_vals_1,u_vals_1);

%Q2

%set up vector of x points
x_vals_2=linspace(-20,20,n);

%forming difrtl operator on lhs
A=diag(x_vals_2);
opp_2=D2-A;
opp_2(1,1)=1; %lhs of lower dirichlet BC
opp_2(1,2)=0;
opp_2(n,n)=1; %lhs of upper dirichlet BC
opp_2(n,n-1)=0;

%forming function vector on rhs
f_vals_2=zeros(n,1);
f_vals_2(1,1)=1; %rhs of lower dirichlet BC


