function Trisec(f,a,b,Tol,N)
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
        disp("There is no root in the given interval")
        return
    end
    i=1;
    tab=[];
    xm1=(2*a+b)/3;
    xm2=(2*b+a)/3;    
    Fxm1=f(xm1);
    Fxm2=f(xm2);
    if abs(Fxm1)<=abs(Fxm2)
        xm=xm1;
        Fxm=Fxm1;
    else
        xm=xm2;
        Fxm=Fxm2;
    end
    E=abs(xm);
    tab=[i a xm b Fxm E];
    while E>Tol && i<N && Fxm1~=0
        if f(a)*Fxm1<0
            b=xm1;
        elseif Fxm1*Fxm2<0
            a=xm1;
            b=xm2;
        else
            a=xm2;
        end
        xm1=(2*a+b)/3;
        xm2=(2*b+a)/3;
        Fxm1=f(xm1);
        Fxm2=f(xm2);
        xant=xm;
        if abs(Fxm1)<=abs(Fxm2)
            xm=xm1;
            Fxm=Fxm1;
        else
            xm=xm2;
            Fxm=Fxm2;
        end
        E=abs(xm-xant);
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
        disp(['An approximation of the root was found with a value ' ...
            'of ']+ string(xm) + " and an error of " + string(E))
        return
    end
    if i==N
        disp("The root was not found in the number of iterations given")
        return
    end
end