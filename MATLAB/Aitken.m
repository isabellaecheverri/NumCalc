function Aitken(f,g,xo,Tol,N)
    disp('Aitken')
    if f(xo)==0
        disp('The initial point given is the root')
    end
    xn=xo;
    Fxn=f(xn);
    Gxn=g(xn);
    tab=[0 xn nan Gxn Fxn nan];
    i=1;
    E=inf;
    while E>Tol && i<N && Fxn~=0
        AitkenMod=false;
        xant=xn;
        xn=Gxn;
        if mod(i,3)==1
            x1=xn;
        elseif mod(i,3)==2
            x2=xn;
        elseif mod(i,3)==0
            xn=xo-((x1-xo)^2/(x2-2*x1+xo));
            xo=xn;
            AitkenMod=true;
        end
        E=abs(xn-xant);
        Fxn=f(xn);
        Gxn=g(xn);
        tab=[tab
            i xn AitkenMod Gxn Fxn E];
        i=i+1;
    end
    res=array2table(tab);
    res.Properties.VariableNames=["Iteration" "xn" "Aitken Modification?" "g(xn)" "f(xn)" "E"];
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