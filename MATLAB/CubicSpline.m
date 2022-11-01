function c=CubicSpline(X,Y)
    disp('Cubic Spline')    
    n=length(X);
    m=4*(n-1); 
    A=zeros(m); 
    b=zeros(m,1);
    
    %Interpolation conditions
    A(1,1:4)=[X(1)^3 X(1)^2 X(1) 1];
    b(1)=Y(1);
    for i=1:n-1
        A(i+1,4*i-3:4*i)=[X(i+1)^3 X(i+1)^2 X(i+1) 1];
        b(i+1)=Y(i+1);
    end
    
    %Continuity conditions
    for i=2:n-1
        A(i+n-1,4*i-7:4*i)=[X(i)^3 X(i)^2 X(i) 1 -X(i)^3 -X(i)^2 -X(i) -1];
        b(i+n-1)=0;
    end
    
    %Smoothness conditions
    for i=2:n-1
        A(i+2*n-3,4*i-7:4*i)=[3*X(i)^2 2*X(i) 1 0 -3*X(i)^2 -2*X(i) -1 0];
        b(i+2*n-3)=0;
    end
    
    %Concavity conditions
    for i=2:n-1
        A(i+3*n-5,4*i-7:4*i)=[6*X(i) 2 0 0 -6*X(i) -2 0 0];
        b(i+3*n-5)=0;
    end

    %Boundary conditions
    A(m-1,1:2)=[6*X(1) 2]; 
    b(m-1)=0;
    A(m,m-3:m-2)=[6*X(end) 2];
    b(m)=0;
    
    c=A\b;
    c=reshape(c,4,[])'; %reorder coefficients (by each polynomial)
    pol=[];
    %to make polynomial string
    for i=1:size(c,1)
        if sign(c(i,2))==-1 && sign(c(i,3))==-1 && sign(c(i,4))==-1
            pol=[pol
                sprintf('%.5f',c(i,1))+"*x^3 - " + sprintf('%.5f',abs(c(i,2)))+ ...
                "*x^2 - "+sprintf('%.5f',abs(c(i,3)))+"*x - "+ ...
                sprintf('%.5f',abs(c(i,4)))];
        elseif sign(c(i,2))==1 && sign(c(i,3))==-1 && sign(c(i,4))==-1
            pol=[pol
                sprintf('%.5f',c(i,1))+"*x^3 + " + sprintf('%.5f',abs(c(i,2)))+ ...
                "*x^2 - "+sprintf('%.5f',abs(c(i,3)))+"*x - "+ ...
                sprintf('%.5f',abs(c(i,4)))];
        elseif sign(c(i,2))==-1 && sign(c(i,3))==1 && sign(c(i,4))==-1
            pol=[pol
                sprintf('%.5f',c(i,1))+"*x^3 - " + sprintf('%.5f',abs(c(i,2)))+ ...
                "*x^2 + "+sprintf('%.5f',abs(c(i,3)))+"*x - "+ ...
                sprintf('%.5f',abs(c(i,4)))];
        elseif sign(c(i,2))==-1 && sign(c(i,3))==-1 && sign(c(i,4))==1
            pol=[pol
                sprintf('%.5f',c(i,1))+"*x^3 - " + sprintf('%.5f',abs(c(i,2)))+ ...
                "*x^2 - "+sprintf('%.5f',abs(c(i,3)))+"*x + "+ ...
                sprintf('%.5f',abs(c(i,4)))];
        elseif sign(c(i,2))==1 && sign(c(i,3))==1 && sign(c(i,4))==-1
            pol=[pol
                sprintf('%.5f',c(i,1))+"*x^3 + " + sprintf('%.5f',abs(c(i,2)))+ ...
                "*x^2 + "+sprintf('%.5f',abs(c(i,3)))+"*x - "+ ...
                sprintf('%.5f',abs(c(i,4)))];
        elseif sign(c(i,2))==-1 && sign(c(i,3))==1 && sign(c(i,4))==1
            pol=[pol
                sprintf('%.5f',c(i,1))+"*x^3 - " + sprintf('%.5f',abs(c(i,2)))+ ...
                "*x^2 + "+sprintf('%.5f',abs(c(i,3)))+"*x + "+ ...
                sprintf('%.5f',abs(c(i,4)))];
        elseif sign(c(i,2))==1 && sign(c(i,3))==-1 && sign(c(i,4))==1
            pol=[pol
                sprintf('%.5f',c(i,1))+"*x^3 + " + sprintf('%.5f',abs(c(i,2)))+ ...
                "*x^2 - "+sprintf('%.5f',abs(c(i,3)))+"*x + "+ ...
                sprintf('%.5f',abs(c(i,4)))];
        else
            pol=[pol
                sprintf('%.5f',c(i,1))+"*x^2 + " + sprintf('%.5f',abs(c(i,2)))+ ...
                "*x + "+sprintf('%.5f',abs(c(i,3)))];
        end
    end
    coef=[0:size(c,1)-1
        c']';
    coef=array2table(coef);
    coef.Properties.VariableNames=["i" "Coefficient a" "Coefficient b"...
        "Coefficient c" "Coefficient d"];
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