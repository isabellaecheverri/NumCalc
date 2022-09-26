function Secant(f,xo,x1,Tol,N)
    disp('Secant')
    if f(xo)==0
        disp('The initial point x0 given is the root')
    end
    if f(x1)==0
        disp('The initial point x1 given is the root')
    end
    xn=xo;
    xsig=x1;
    Fxn=f(xn);
    tab=[0 xn Fxn nan];
    Fxn=f(xsig);
    tab=[tab
        1 xsig Fxn nan];
    i=2;
    E=inf;
    while E>Tol && i<N && Fxn~=0
        xant=xn;
        xn=xsig;
        xsig=xn-(f(xn)/((f(xn)-f(xant))/(xn-xant)));
        E=abs(xsig-xn);
        Fxn=f(xsig);
        tab=[tab
            i xsig Fxn E];
        i=i+1;
    end
    res=array2table(tab);
    res.Properties.VariableNames=["Iteration" "xn" "f(xn)" "E"];
    disp(res)
    if Fxn==0
        disp('The root was found with a value of '+ string(xn))
        return
    end
    if E<=Tol
        disp(['An aproximation of the root was found with a value ' ...
            'of ']+ string(xn) + " and an error of " + string(E))
        return
    end
    if i==N
        disp("The root was not found in the number of iterations given")
        return
    end
end