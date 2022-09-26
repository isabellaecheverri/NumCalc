function FalsePos(f,a,b,Tol,N)
    disp("False Position")
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
        disp("There is no root in the given interval")
        return
    end
    i=1;
    tab=[];
    E=inf;
    Fxn=1;
    while E>Tol && i<N && Fxn~=0
        xn=b-f(b)*((b-a)/(f(b)-f(a)));
        Fxn=f(xn);
        if f(a)*Fxn>0
            E=abs(xn-a);
            tab=[tab
            i a xn b Fxn E];
            a=xn;
        elseif f(b)*Fxn>0
            E=abs(xn-b);
            tab=[tab
            i a xn b Fxn E];
            b=xn;
        end
        i=i+1;
    end
    res=array2table(tab);
    res.Properties.VariableNames=["Iteration" "a" "xn" "b" "f(xn)" "E"];
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