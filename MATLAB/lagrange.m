function c=lagrange(X,Y)
    disp('Lagrange Interpolation')
    n=length(X);
    L=zeros(1,n);
    
    for i=1:n
        den=X(i)-X;
        den(i)=[];
        L(i)=1/prod(den);
    end
    %polynomials (string)
    str=[];
    for i=1:n
        if sign(X(i))==-1
            str=[str "(x + "+sprintf('%.5f',abs(X(i)))+")"];
        elseif sign(X(i))==1
            str=[str "(x - "+sprintf('%.5f',X(i))+")"];
        else
            str=[str "(x)"];
        end
    end
    Lp=[];
    for i=1:n
        Lp=[Lp sprintf('%.5f',L(i))+"*"+strjoin(string(str(1:end~=i)))];
    end
    tab=[string(0:n-1)
        Lp]';
    tab=array2table(tab);
    tab.Properties.VariableNames=["i" "Li(x)"];
    tab.i=categorical(tab.i);
    tab.("Li(x)")=categorical(tab.("Li(x)"));
    disp('Lagrange interpolating polynomials')
    disp(tab)
    c=L.*Y;
    disp('Polynomial Coefficients')
    fprintf('%.5f\n',c)
    %to display polynomial
    pol=string(c(1))+'*'+strjoin(string(str(2:end)),'*');
    for i=2:n-1
        if sign(c(i))==1
            pol=pol+" + "+string(c(i))+'*'+strjoin(string(str(1:end~=i)));
        elseif sign(c(i))==-1
            pol=pol+" - "+string(abs(c(i)))+'*'+strjoin(string(str(1:end~=i)));
        end
    end
    disp('Polynomial')
    disp(pol)
end