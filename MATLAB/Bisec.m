function Bisec(f,a,b,Tol,N)
    disp("Bisection")
    if a>=b
        disp("The given interval is not valid, a is greater or " + ...
            "equal to b")
        return
    end
    if f(a)==0
        disp("The root is the given value for a," + string(a))
        return
    end
    if f(b)==0
        disp("The root is the given value for b," + string(b))
        return
    end
    if f(a)*f(b)>0
        disp("There is possibly no root in the given interval")
        return
    end
    i=1;
    tab=[];
    xm=(a+b)/2;
    E=abs(xm);
    Fxm=f(xm);
    tab=[i a xm b Fxm E];
    while E>Tol && i<N && Fxm~=0
        if f(a)*Fxm<0
            b=xm;
            xm=(a+b)/2;  
            E=abs(xm-b);
        elseif f(b)*Fxm<0
            a=xm;
            xm=(a+b)/2;
            E=abs(xm-a);
        end
        Fxm=f(xm);
        i=i+1;
        tab=[tab
            i a xm b Fxm E];
    end
    res=array2table(tab);
    res.Properties.VariableNames=["Iteration" "a" "xn" "b" "f(xn)" "E"];
    disp(res)
    if Fxm==0
        disp('The root was found with a value of '+ string(xm))
        return
    end
    if E<=Tol
        disp(['An aproximation of the root was found with a value ' ...
            'of ']+ string(xm) + " and an error of " + string(E))
        return
    end
    if i==N
        disp("The root was not found in the number of iterations given")
        return
    end
end