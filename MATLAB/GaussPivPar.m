function [x]=GaussPivPar(A,b)
    disp("Gaussian Elimination with Partial Pivot")
    if det(A)==0
        error('The system has no solution, the determinant of A is zero')
    end
    [U,B]=ElimPivPar(A,b);
    x=RegSubst(U,B);
    disp('Solution')
    disp(x)
end

function [U,B]=ElimPivPar(A,b)
    Ab=[A b];
    [f,c]=size(Ab);
    disp('Stage 0')
    disp(Ab)
    for j=1:c-2
        col=abs(Ab(j:f,j));
        m=find(col==max(col));
        m=m(1);
        temp=Ab(j,:);
        Ab(j,:)=Ab(m+j-1,:);
        Ab(m+j-1,:)=temp;
        for i=j:f-1
            Ab(i+1,j:c)=Ab(i+1,j:c)-(Ab(i+1,j)/Ab(j,j))*Ab(j,j:c);
        end
        disp('Stage '+ string(j))
        disp(Ab)
    end
    U=Ab(:,1:c-1);
    B=Ab(:,end);
end