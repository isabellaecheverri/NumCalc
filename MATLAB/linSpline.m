function c=linSpline(X,Y)
    disp('Linear Spline')    
    n=length(X);
    m=2*(n-1); 
    A=zeros(m); 
    b=zeros(m,1);
    
    %Interpolation conditions
    A(1,[1 2])=[X(1) 1];
    b(1)=Y(1);
    for i=1:n-1
        A(i+1,[2*i-1 2*i])=[X(i+1) 1];
        b(i+1)=Y(i+1);
    end
    
    %Continuity conditions
    for i=2:n-1
        A(i+n-1,2*i-3:2*i)=[X(i) 1 -X(i) -1];
        b(i+n-1)=0;
    end

    c=A\b;
    c=reshape(c,2,[])'; %reorder coefficients (by each polynomial)
    pol=[];
    for i=1:size(c,1)
        if sign(c(i,2))==-1
            pol=[pol
                sprintf('%.5f',c(i,1))+"*x - " + sprintf('%.5f',abs(c(i,2)))];
        else
            pol=[pol
                sprintf('%.5f',c(i,1))+"*x + " + sprintf('%.5f',c(i,2))];
        end
    end
    coef=[0:size(c,1)-1
        c']';
    coef=array2table(coef);
    coef.Properties.VariableNames=["i" "Coefficient a" "Coefficient b"];
    disp('Coefficients')
    disp(coef)
    splines=[0:size(c,1)-1
        erase(pol,'*')']';
    splines=array2table(splines);
    splines.Properties.VariableNames=["i" "Spline"];
    splines.i=categorical(splines.i);
    splines.Spline=categorical(splines.Spline);
    disp('Splines')
    disp(splines)
end