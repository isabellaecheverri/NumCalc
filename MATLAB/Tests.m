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



%% Factorizacion

A=[4 3 -2 -7
    3 12 8 -3
    2 3 -9 3
    1 -2 -5 6];
b=[20
    18
    31
    12];

A=[-7 2 -3 4
    5 -1 14 -1
    1 9 -7 5
    -12 13 -8 -4];
b=[-12
    13
    31
    -32];

A=[36 3 -4 5
    5 -45 10 -2
    6 8 57 5
    2 3 -8 -42];
b=[-20
    69
    96
    -32];
%% LU Factoriation
clc
LUFact(A,b);

%% LU Factoriation Partial Pivot
clc
LUFactParPiv(A,b);

%% Doolittle LU Factoriation
clc
doolittleFact(A,b);

%% Crout LU Factoriation
clc
croutFact(A,b);

%% Cholesky LU Factoriation
clc
cholFact(A,b);

%% Iterative Methods
A=[8 3 5
    -2 7 3
    4 -5 18];
b=[21
    7
    42];
Tol=10^(-7);
p=2; %norm
x0=[0
    0
    0];
N=100;
%% Jacobi
clc
x=Jacobi(A,b,x0,p,Tol,N);

%% Gauss-Seidel
clc
x=gseidel(A,b,x0,p,Tol,N);

%% SOR
clc
x=SOR(A,b,x0,p,1,Tol,N);
%%
A=[2.04 -1 0
    -1 2.04 -1
    0 -1 2.04];
b=[48.8
    0.8
    0.8];
Tridiag(A,b)

%% Interpolacion
X=[-1 0 3 4];
Y=[15.5 3 8 1];

%% Vandermonde
clc
c=vandermonde(X,Y);

%% Divided differences (Newton)
clc
c=divdif(X,Y);

%% Lagrange
clc
c=lagrange(X,Y);

%% Linear Spline
clc
c=linSpline(X,Y);

%% Cuadratic Spline
clc
c=CuadSpline(X,Y);

%% Cubic Spline
clc
c=CubicSpline(X,Y);
%%
% Aditional Methods

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

%% Integration
f=@(x) x*sin(x);
a=3;
b=10;
N=100;
%% Composite Trapezoidal Rule
clc
CompTrapezoid(f,a,b,N);

%% Composite Simpson's 1/3 rule
clc
Simpson1_3Rule(f,a,b,N);

%% Simple Simpson's 3/8 rule
clc 
Simpson3_8Rule(f,a,b);

%% Differential Equations
f=@(t,y) y-t^2+1;
t0=0;
tn=3;
h=0.25;
y0=0;
%% Euler
clc
Euler(f,t0,tn,y0,h);

%% Heun
clc
Heun(f,t0,tn,y0,h);