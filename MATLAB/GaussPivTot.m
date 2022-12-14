function [x]=GaussPivTot(A,b)
    disp("Gaussian Elimination with Total Pivot")
    if det(A)==0
        error('The system has no solution, the determinant of A is zero')
    end
    [U,B,marcas]=ElimPivTot(A,b);
    x=RegSubst(U,B);
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
        mi=mi(1);
        mj=mj(1);
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
