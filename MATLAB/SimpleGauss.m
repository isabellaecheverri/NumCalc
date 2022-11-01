function [x]=SimpleGauss(A,b)
    disp("Simple Gaussian Elimination")
    if det(A)==0
        error('The system has no solution, the determinant of A is zero')
    end
    for i=1:size(A,2)
        if A(i,i)==0
            error('There is a 0 in the diagonal, consider changing the rows')
        end
    end
    [U,B]=Elim(A,b);
    x=RegSubst(U,B);
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
