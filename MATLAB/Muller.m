function Muller(f,x1,x2,x3,Tol,N)
    disp('Muller')
    if f(x1)==0
        disp('The initial point x1 given is the root')
    end
    if f(x2)==0
        disp('The initial point x2 given is the root')
    end
    if f(x3)==0
        disp('The initial point x3 given is the root')
    end
    Fx1=f(x1); %x1 is xn-2
    Fx2=f(x2); %x2 is xn-1
    Fx3=f(x3); %x3 is xn
    tab=[1 x1 Fx1 nan
        2 x2 Fx2 abs(x2-x1)
        3 x3 Fx3 abs(x3-x2)];
    Fxn=f(x3);
    i=4;
    E=inf;
    while E>Tol && i<N && Fxn~=0
        q=(x3-x2)/(x2-x1);
        c=(1+q)*Fx3;
        b=(2*q+1)*Fx3-(1+q)^2*Fx2+q^2*Fx1;
        a=q*Fx3-q*(1+q)*Fx2+q^2*Fx1;
        disc=b^2-4*a*c;
        xn1=x3-(x3-x2)*(2*c/(b+sqrt(disc)));
        xn2=x3-(x3-x2)*(2*c/(b-sqrt(disc)));
        if abs(f(xn1))<=abs(f(xn2))
            xn=xn1;
        else 
            xn=xn2;
        end
        E=abs(xn-x3);
        Fxn=f(xn);
        tab=[tab
            i xn Fxn E];
        x1=x2;
        x2=x3;
        x3=xn;
        Fx1=f(x1); 
        Fx2=f(x2);
        Fx3=f(x3);
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