function I=Simpson1_3Rule(f,a,b,n)
    disp('Composite Simpson 1/3 Rule')
    if mod(n,2)==1
        disp('n must be an even number')
        I=[];
        return
    end
    h=(b-a)/n;
    I=f(a)+f(b);
    for i=1:n-1
        x=a+i*h;
        if mod(i,2)==0
            I=I+2*f(x);
        else
            I=I+4*f(x);
        end
    end
    I=(h/3)*I;
    disp('The aproximated value of the integral of f(x) from a to b is')
    fprintf('%.8f\n',I)
end