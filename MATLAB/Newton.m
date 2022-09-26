function Newton(f,df,xo,Tol,N)
    disp('Newton-Raphson')
    if f(xo)==0
        disp('The initial point given is the root')
    end
    xn=xo;
    Fxn=f(xn);
    tab=[0 xn Fxn nan];
    i=1;
    E=inf;
    while E>Tol && i<N && Fxn~=0
        xant=xn;
        xn=xant-(f(xant)/df(xant));
        E=abs(xn-xant);
        Fxn=f(xn);
        tab=[tab
            i xn Fxn E];
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