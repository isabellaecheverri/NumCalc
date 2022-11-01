function I=Simpson3_8Rule(f,a,b)
    disp('Simple Simpson 3/8 Rule')
    h=(b-a)/3;
    x1=(2*a+b)/3;
    x2=(a+2*b)/3;
    I=f(a)+3*f(x1)+3*f(x2)+f(b);
    I=(3*h/8)*I;
    disp('The approximated value of the integral of f(x) from a to b is')
    fprintf('%.8f\n',I)
end