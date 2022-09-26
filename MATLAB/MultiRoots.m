function MultiRoots(f,df,d2f,xo,Tol,N)
    disp('Multiple Roots')
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
        F=f(xant);
        dF=df(xant);
        d2F=d2f(xant);
        xn=xant-(F*dF)/((dF^2)-F*d2F);
        Fxn=f(xn);
        E=abs(xn-xant);
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