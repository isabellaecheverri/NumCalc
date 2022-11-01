function I=CompTrapezoid(f,a,b,n)
    disp('Composite Trapezoidal Rule')
    h=(b-a)/n;
    I=f(a)+f(b);
    for i=1:n-1
        x=a+i*h;
        I=I+2*f(x);
    end
    I=(h/2)*I;
    disp('The approximated value of the integral of f(x) from a to b is')
    fprintf('%.8f\n',I)
end