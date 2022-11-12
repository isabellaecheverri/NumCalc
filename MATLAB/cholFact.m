function [x]=cholFact(A,b)
    disp("Cholesky LU Factorization")
    if det(A)==0
        error('The system has no solution, the determinant of A is zero')
    end
    [L,U]=cholesky(A);
    disp('Lower Triangular Matrix L')
    disp(L)
    disp('Upper Triangular Matrix U')
    disp(U)
    z=ProgSubst(L,b);
    x=RegSubst(U,z.');
    disp('Progressive substitution Lz=b')
    disp(z);
    disp('Regresive substitution Ux=z, solution')
    disp(x);
end

function [L,U]=cholesky(A)
    [f,c]=size(A);
    L=zeros(f,c);
    U=zeros(f,c);
    L(1,1)=sqrt(A(1,1));
    U(1,1)=L(1,1);
    L(2:end,1)=A(2:end,1)/L(1,1);
    U(1,2:end)=A(1,2:end)/L(1,1);
    for j=2:c
        for i=2:f
            if i>j
                L(i,j)=(A(i,j)-dot(L(i,1:j-1),U(1:j-1,j)'))/L(j,j);
            elseif i==j
                L(i,i)=sqrt(A(i,i)-dot(L(i,1:j-1),U(1:j-1,i)'));
                U(i,i)=L(i,i);
            else
                U(i,j)=(A(i,j)-dot(L(i,1:j-1),U(1:j-1,j)'))/L(i,i);
            end
        end
    end
end
