function [x]=croutFact(A,b)
    disp("Crout LU Factorization")
    if det(A)==0
        error('The system has no solution, the determinant of A is zero')
    end
    [L,U]=crout(A);
    disp('Lower Triangular Matrix L')
    disp(L)
    disp('Upper Triangular Matrix U')
    disp(U)
    z=ProgSubst(L,b);
    x=RegSubst(U,z');
    disp('Progressive substitution Lz=b')
    disp(z);
    disp('Regresive substitution Ux=z, solution')
    disp(x);
end

function [L,U]=crout(A)
    [f,c]=size(A);
    L=zeros(f,c);
    U=eye(f);
    L(:,1)=A(:,1);
    U(1,2:end)=A(1,2:end)/L(1,1);
    for j=2:c
        for i=2:f
            if i>=j
                L(i,j)=A(i,j)-dot(L(i,1:i-1),U(1:i-1,j)');
            else
                U(i,j)=(A(i,j)-dot(L(i,1:j-1),U(1:j-1,j)'))/L(i,i);
            end
        end
    end
end
