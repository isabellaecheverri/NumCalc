function [x]=GaussPivPar(A,b)
    disp("Gaussian Elimination with Partial Pivot")
    [U,B]=ElimPivPar(A,b);
    x=substitution(U,B);
    disp('Solution')
    disp(x)
end

function [x]=substitution(U,B)
    [f,c]=size(U);
    x(f)=B(f)/U(f,f);
    for i=f-1:-1:1
        sum=0;
        for j=i+1:f
            sum=sum+U(i,j)*x(j);
        end
        x(i)=(B(i)-sum)/U(i,i);
    end
end

function [U,B]=ElimPivPar(A,b)
    Ab=[A b];
    [f,c]=size(Ab);
    disp('Stage 0')
    disp(Ab)
    for j=1:c-2
        col=abs(Ab(j:f,j));
        m=find(col==max(col));
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