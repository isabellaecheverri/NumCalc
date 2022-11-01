function [x]=LUFact(A,b)
    disp("LU Factorization")
    if det(A)==0
        error('The system has no solution, the determinant of A is zero')
    end
    for i=1:size(A,2)
        if A(i,i)==0
            error('There is a 0 in the diagonal, consider changing the rows')
        end
    end
    [L,U]=LU(A);
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

function [L,U]=LU(A)
    [f,c]=size(A);
    L=eye(f);
    disp('Stage 0')
    disp(A)
    for j=1:c-1
        for i=j:f-1
            Mij=A(i+1,j)/A(j,j);
            A(i+1,j:c)=A(i+1,j:c)-(Mij)*A(j,j:c);
            L(i+1,j)=Mij;
        end
        disp('Stage '+ string(j))
        disp(A)
        disp('L('+string(j)+') = [ '+ sprintf('%d ', L(:,j))+']')
        disp('U('+string(j)+') = [ '+ sprintf('%d ', A(j,:))+']')
    end
    U=A;
end