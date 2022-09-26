function [x]=GaussPivTot(A,b)
    disp("Gaussian Elimination with Total Pivot")
    [U,B,marcas]=ElimPivTot(A,b);
    x=substitution(U,B);
    f=size(x,2);
    xtemp=[];
    for i=1:f
        ind=marcas(i);
        xtemp(ind)=x(i);
    end
    x=xtemp;
    disp('Solution')
    disp(x)
end

function [U,B,marcas]=ElimPivTot(A,b)
    Ab=[A b];
    [f,c]=size(Ab);
    marcas=1:c-1;
    disp('Stage 0')
    disp(Ab)
    for j=1:c-2
        %submatrix
        subm=abs(Ab(j:f,j:c-1));
        [mi,mj]=find(subm==max(subm,[],'all'));
        %row change
        temp=Ab(j,j:end);
        Ab(j,j:end)=Ab(mi+j-1,j:end);
        Ab(mi+j-1,j:end)=temp;
        %column change
        temp=Ab(:,j);
        Ab(:,j)=Ab(:,mj+j-1);
        Ab(:,mj+j-1)=temp;
        %tags change
        temp=marcas(j);
        marcas(j)=marcas(mj+j-1);
        marcas(mj+j-1)=temp;
        for i=j:f-1
            Ab(i+1,j:c)=Ab(i+1,j:c)-(Ab(i+1,j)/Ab(j,j))*Ab(j,j:c);
        end
        disp('Stage '+ string(j))
        disp(Ab)
    end
    U=Ab(:,1:c-1);
    B=Ab(:,end);
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