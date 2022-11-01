function c=divdif(X,Y)
    disp('Divided Differences')
    n=length(X);
    A=zeros(n);
    A(:,1)=Y';
    
    for j=2:n
        for i=j:n
            A(i,j)=(A(i,j-1)-A(i-1,j-1))/(X(i)-X(i-j+1));
        end
    end
    c=diag(A);
    tab=[X' A];
    tab=array2table(tab);
    tab.Properties.VariableNames=["xi" "f(xi)" string(1:n-1)];
    disp('Divided Difference Table')
    disp(tab)
    disp('Polynomial Coefficients')
    fprintf('%.5f\n',c)
    %to display polynomial
    if sign(X(1))==-1
        str=["" "(x + "+sprintf('%.5f',abs(X(1)))+")"];
    else
        str=["" "(x - "+sprintf('%.5f',X(1))+")"];
    end
    for i=2:n
        if sign(X(i))==-1
            str=[str str(i)+"*(x + "+sprintf('%.5f',abs(X(i)))+")"];
        elseif sign(X(i))==1
            str=[str str(i)+"*(x - "+sprintf('%.5f',X(i))+")"];
        else
            str=[str str(i)+"*(x)"];
        end
    end
    str(1)=[];
    pol=sprintf('%.5f',c(1));
    for i=2:n
        if sign(c(i))==1
            pol=pol+" + "+sprintf('%.5f',c(i))+"*"+str(i-1);
        elseif sign(c(i))==-1
            pol=pol+" - "+sprintf('%.5f',abs(c(i)))+"*"+str(i-1);
        end
    end
    disp('Polynomial')
    disp(erase(pol,'*'))
end