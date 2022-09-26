%% Functions and parameters
Tol=1*10^(-7);
N=100;
f=@(x) log(sin(x)^2+1)-1/2;
df=@(x) 2*(sin(x)^2+1)^(-1)*sin(x)*cos(x);
f1=@(x) log(sin(x)^2+1)-1/2-x;
g=@(x) log(sin(x)^2+1)-1/2;
h=@(x) exp(x)-x-1;
dh=@(x) exp(x)-1;
d2h=@(x) exp(x);
%% Decimals
format long
%% Incremental search
clc
xo=-3;
dx=0.5;
IncrSearch(f,xo,dx,N)

%% Bisection
clc
a=0;
b=1;
Bisec(f,a,b,Tol,N)

%% False Position
clc
a=0;
b=1;
FalsePos(f,a,b,Tol,N)

%% Newton
clc
xo=0.5;
Newton(f,df,xo,Tol,N)

%% Fixed Point
clc
xo=-0.5;
FixedPoint(f1,g,xo,Tol,N)

%% Secant
clc
xo=0.5;
x1=1;
Secant(f,xo,x1,Tol,N)

%% Multiple Roots
clc
xo=1;
MultiRoots(h,dh,d2h,xo,Tol,N)

%% Solution to linear system of equations
A=[2 -1 0 3
    1 0.5 3 8
    0 13 -2 11
    14 5 -2 3];
b=[1
    1
    1
    1];

%% Simple gaussian elimination
clc
SimpleGauss(A,b);

%% Gaussian elimination with partial pivot
clc
GaussPivPar(A,b);

%% Gaussian elimination with total pivot
clc
GaussPivTot(A,b);

%%
% Metodos Adicionales

%% Steffensen
clc
xo=0.5;
Steffensen(f,xo,Tol,N)

%% Aitken (fixed Point)
clc
xo=-0.5;
Aitken(f1,g,xo,Tol,N)

%% Muller 
f2=@(x) x^3-x^2-x-1;
x1=0;
x2=1;
x3=2;
Muller(f2,x1,x2,x3,Tol,N)

%% Trisection
clc
a=0;
b=1;
Trisec(f,a,b,Tol,N)

%%
A=[2.04 -1 0
    -1 2.04 -1
    0 -1 2.04];
b=[48.8
    0.8
    0.8];
Tridiag(A,b)