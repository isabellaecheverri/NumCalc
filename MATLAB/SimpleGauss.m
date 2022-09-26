function [x]=SimpleGauss(A,b)
    disp("Simple Gaussian Elimination")
    [U,B]=Elim(A,b);
    x=substitution(U,B);
    disp('Solution')
    disp(x)
end

function [U,B]=Elim(A,b)
    Ab=[A b];
    [f,c]=size(Ab);
    disp('Stage 0')
    disp(Ab)
    for j=1:c-2
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