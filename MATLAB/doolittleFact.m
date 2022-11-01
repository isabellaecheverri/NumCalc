function [x]=doolittleFact(A,b)
    disp("Doolitle LU Factorization")
    if det(A)==0
        error('The system has no solution, the determinant of A is zero')
    end
    [L,U]=doolittle(A);
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

function [L,U]=doolittle(A)
    [f,c]=size(A);
    L=eye(f);
    U=zeros(f,c);
    for j=1:c
        for i=1:f
            if i<=j
                U(i,j)=A(i,j);
                U(i,j)=U(i,j)-dot(L(i,1:i-1),U(1:i-1,j)');
            else
                L(i,j)=A(i,j);
                L(i,j)=L(i,j)-dot(L(i,1:j-1),U(1:j-1,j)');
                L(i,j)=L(i,j)/U(j,j);
            end
        end
    end
end
