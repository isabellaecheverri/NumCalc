function [x]=gseidel(A,b,x0,p,Tol,N)
    disp('Gauss-Seidel')
    if det(A)==0
        error('The system has no solution, the determinant of A is zero')
    end
    D=diag(diag(A));
    L=-tril(A)+D;
    U=-triu(A)+D;
    T=inv(D-L)*U;
    C=inv(D-L)*b;
    ro=max(abs(eig(T))); %spectral radius of iteration matrix
    disp("Spectral Radius: " + sprintf('%.5f',ro))
    if ro>1
        disp('Spectral radius of the iteration matrix is greater than 1')
        disp('The method cannot be executed')
        return
    end
    x=x0;
    i=0;
    E=inf;
    tab=[i nan x'];
    while E>Tol && i<N
        xprev=x;
        x=T*xprev+C;
        E=norm(x-xprev,p);
        i=i+1;
        tab=[tab
            i E x'];
    end
    res=array2table(tab);
    res=mergevars(res,3:2+size(x0));
    res.Properties.VariableNames=["Iteration" "Error" "xn"];
    disp(res)
end
