function c=vandermonde(X,Y)
    disp('Vandermonde')
    if length(X)~=length(unique(X))
        disp('There is a repeated value for x')
        return
    end
    n=length(X);
    A=zeros(n);
    %Matrix
    for i=1:n
        A(:,i)=(X.^(n-i))';
    end
    c=A\Y';
    disp('Polynomial coefficients')
    fprintf('%.5f\n',c')
    disp('Polynomial')
    %To display polynomial
    pol=sprintf('%.5f',c(1))+"*x^"+string(n-1);
    for i=2:n-1
        if sign(c(i))==1
            pol=pol+" + "+sprintf('%.5f',c(i))+"*x^"+string(n-i);
        elseif sign(c(i))==-1
            pol=pol+" - "+sprintf('%.5f',abs(c(i)))+"*x^"+string(n-i);
        end
    end
    if sign(c(end))==1
        pol=pol+" + "+sprintf('%.5f',c(end));
    elseif sign(c(end))==-1
        pol=pol+" - "+sprintf('%.5f',c(end));
    end
    disp(erase(pol,'*'))
end