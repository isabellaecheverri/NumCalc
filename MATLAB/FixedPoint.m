function FixedPoint(f,g,xo,Tol,N)
    disp('Fixed Point')
    if f(xo)==0
        disp('The initial point given is the root')
    end
    xn=xo;
    Fxn=f(xn);
    Gxn=g(xn);
    tab=[0 xn Gxn Fxn nan];
    i=1;
    E=inf;
    while E>Tol && i<N && Fxn~=0
        xant=xn;        
        xn=Gxn;
        E=abs(xn-xant);
        Fxn=f(xn);
        Gxn=g(xn);
        tab=[tab
            i xn Gxn Fxn E];
        i=i+1;
    end
    res=array2table(tab);
    res.Properties.VariableNames=["Iteration" "xn" "g(xn)" "f(xn)" "E"];
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